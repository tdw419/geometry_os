; DESCRIPTION: Creates a black circular shape at (307, 198) with radius 51.
; PLAN: r0=307(x), r1=198(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 198
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
