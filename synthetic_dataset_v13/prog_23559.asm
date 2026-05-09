; DESCRIPTION: Draws a purple circle centered at (235, 139) with radius 55.
; PLAN: r0=235(x), r1=139(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 139
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
