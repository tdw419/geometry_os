; DESCRIPTION: Draws a black circle centered at (405, 67) with radius 24.
; PLAN: r0=405(x), r1=67(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 67
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
