; DESCRIPTION: Draws a purple circle centered at (235, 166) with radius 33.
; PLAN: r0=235(x), r1=166(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 166
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
