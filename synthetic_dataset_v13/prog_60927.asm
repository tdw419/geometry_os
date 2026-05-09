; DESCRIPTION: Draws a purple circle centered at (235, 203) with radius 41.
; PLAN: r0=235(x), r1=203(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 203
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
