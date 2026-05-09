; DESCRIPTION: Draws a black circle centered at (401, 137) with radius 67.
; PLAN: r0=401(x), r1=137(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 137
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
