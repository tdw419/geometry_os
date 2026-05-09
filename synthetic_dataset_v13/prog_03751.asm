; DESCRIPTION: Composite: Sets a single blue pixel at (97, 136) then Renders a green disk with center (367, 138) and radius 68 then Places a orange line segment connecting (11, 172) to (360, 144).
; PLAN: r0=97(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=138(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x1), r11=172(y1), r12=360(x2), r13=144(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 138
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 172
LDI r12, 360
LDI r13, 144
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
