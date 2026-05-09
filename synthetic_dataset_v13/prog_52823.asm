; DESCRIPTION: Draws a black circle centered at (82, 121) with radius 21.
; PLAN: r0=82(x), r1=121(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 121
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
