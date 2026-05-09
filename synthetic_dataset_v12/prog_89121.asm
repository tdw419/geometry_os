; DESCRIPTION: Draws a black circle centered at (344, 87) with radius 55.
; PLAN: r0=344(x), r1=87(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 87
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
