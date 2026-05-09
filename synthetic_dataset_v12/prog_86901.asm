; DESCRIPTION: Draws a black circle centered at (368, 148) with radius 64.
; PLAN: r0=368(x), r1=148(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 148
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
