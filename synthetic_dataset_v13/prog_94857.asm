; DESCRIPTION: Composite: Renders a orange disk with center (266, 141) and radius 78 then Places a white dot at position (15, 2) then Places a magenta line segment connecting (484, 80) to (247, 150).
; PLAN: r0=266(x), r1=141(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=2(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=484(x1), r11=80(y1), r12=247(x2), r13=150(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 141
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 2
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 484
LDI r11, 80
LDI r12, 247
LDI r13, 150
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
