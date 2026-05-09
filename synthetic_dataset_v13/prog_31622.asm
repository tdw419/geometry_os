; DESCRIPTION: Draws a black circle centered at (327, 109) with radius 45.
; PLAN: r0=327(x), r1=109(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 109
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
