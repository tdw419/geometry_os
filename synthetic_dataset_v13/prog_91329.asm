; DESCRIPTION: Draws a black circle centered at (344, 133) with radius 45.
; PLAN: r0=344(x), r1=133(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 133
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
