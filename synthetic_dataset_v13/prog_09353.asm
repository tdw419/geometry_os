; DESCRIPTION: Composite: Places a white dot at position (437, 40) then Places a yellow line segment connecting (336, 189) to (127, 45) then Creates a red rectangular region at (193, 196) spanning 48 by 31 pixels.
; PLAN: r0=437(x), r1=40(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=336(x1), r6=189(y1), r7=127(x2), r8=45(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=196(y), r12=48(width), r13=31(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 40
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 336
LDI r6, 189
LDI r7, 127
LDI r8, 45
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 196
LDI r12, 48
LDI r13, 31
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
