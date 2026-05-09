; DESCRIPTION: Draws a black circle centered at (288, 102) with radius 25.
; PLAN: r0=288(x), r1=102(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 102
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
