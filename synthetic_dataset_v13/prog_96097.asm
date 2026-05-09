; DESCRIPTION: Composite: Renders a orange line between points (201, 235) and (84, 223) then Sets a single magenta pixel at (121, 205) then Places a magenta circle of radius 23 at center (400, 166).
; PLAN: r0=201(x1), r1=235(y1), r2=84(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=205(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=400(x), r11=166(y), r12=23(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 235
LDI r2, 84
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 205
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 400
LDI r11, 166
LDI r12, 23
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
