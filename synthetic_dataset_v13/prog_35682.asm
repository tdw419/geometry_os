; DESCRIPTION: Draws a black circle centered at (128, 133) with radius 79.
; PLAN: r0=128(x), r1=133(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 133
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
