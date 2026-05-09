; DESCRIPTION: Composite: Renders a magenta disk with center (348, 113) and radius 74 then Sets a single white pixel at (314, 178) then Places a orange line segment connecting (462, 32) to (221, 130).
; PLAN: r0=348(x), r1=113(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=178(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=462(x1), r11=32(y1), r12=221(x2), r13=130(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 113
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 178
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 462
LDI r11, 32
LDI r12, 221
LDI r13, 130
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
