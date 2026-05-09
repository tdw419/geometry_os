; DESCRIPTION: Draws a black circle centered at (117, 96) with radius 45.
; PLAN: r0=117(x), r1=96(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 96
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
