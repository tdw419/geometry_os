; DESCRIPTION: Draws a black circle centered at (90, 179) with radius 72.
; PLAN: r0=90(x), r1=179(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 179
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
