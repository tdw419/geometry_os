; DESCRIPTION: Draws a black circle centered at (346, 67) with radius 50.
; PLAN: r0=346(x), r1=67(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 67
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
