; DESCRIPTION: Composite: Sets a single white pixel at (289, 43) then Places a purple circle of radius 30 at center (452, 35) then Draws a orange line from (129, 219) to (361, 126).
; PLAN: r0=289(x), r1=43(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=452(x), r6=35(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x1), r11=219(y1), r12=361(x2), r13=126(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 43
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 35
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 219
LDI r12, 361
LDI r13, 126
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
