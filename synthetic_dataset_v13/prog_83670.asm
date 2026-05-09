; DESCRIPTION: Draws a black circle centered at (218, 175) with radius 76.
; PLAN: r0=218(x), r1=175(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 175
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
