; DESCRIPTION: Draws a black circle centered at (469, 51) with radius 42.
; PLAN: r0=469(x), r1=51(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 51
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
