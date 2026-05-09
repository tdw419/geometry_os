; DESCRIPTION: Composite: Places a white dot at position (388, 230) then Renders a purple line between points (281, 128) and (73, 58) then Renders a orange disk with center (33, 76) and radius 20.
; PLAN: r0=388(x), r1=230(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=281(x1), r6=128(y1), r7=73(x2), r8=58(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=76(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 230
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 281
LDI r6, 128
LDI r7, 73
LDI r8, 58
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 76
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
