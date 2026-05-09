; DESCRIPTION: Draws a purple circle centered at (292, 235) with radius 17.
; PLAN: r0=292(x), r1=235(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 235
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
