; DESCRIPTION: Draws a black circle centered at (392, 172) with radius 67.
; PLAN: r0=392(x), r1=172(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 172
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
