; DESCRIPTION: Composite: Sets a single orange pixel at (192, 122) then Renders a white box of size 24x102 starting at (478, 97) then Renders a blue line between points (483, 0) and (308, 140).
; PLAN: r0=192(x), r1=122(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=97(y), r7=24(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=483(x1), r11=0(y1), r12=308(x2), r13=140(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 122
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 478
LDI r6, 97
LDI r7, 24
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 0
LDI r12, 308
LDI r13, 140
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
