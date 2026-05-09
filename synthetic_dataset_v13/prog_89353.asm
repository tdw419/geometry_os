; DESCRIPTION: Draws a black circle centered at (387, 81) with radius 66.
; PLAN: r0=387(x), r1=81(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 81
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
