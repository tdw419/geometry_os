; DESCRIPTION: Draws a purple circle centered at (284, 137) with radius 78.
; PLAN: r0=284(x), r1=137(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 137
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
