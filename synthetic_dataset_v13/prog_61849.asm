; DESCRIPTION: Draws a black circle centered at (284, 72) with radius 32.
; PLAN: r0=284(x), r1=72(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 72
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
