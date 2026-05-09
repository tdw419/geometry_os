; DESCRIPTION: Composite: Places a blue circle of radius 63 at center (119, 110) then Places a magenta line segment connecting (356, 63) to (282, 118) then Places a orange dot at position (243, 157).
; PLAN: r0=119(x), r1=110(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x1), r6=63(y1), r7=282(x2), r8=118(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=157(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 110
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 63
LDI r7, 282
LDI r8, 118
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 157
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
