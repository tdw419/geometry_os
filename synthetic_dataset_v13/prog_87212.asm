; DESCRIPTION: Draws a purple circle centered at (235, 151) with radius 69.
; PLAN: r0=235(x), r1=151(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 151
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
