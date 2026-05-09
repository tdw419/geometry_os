; DESCRIPTION: Draws a black circle centered at (288, 149) with radius 60.
; PLAN: r0=288(x), r1=149(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 149
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
