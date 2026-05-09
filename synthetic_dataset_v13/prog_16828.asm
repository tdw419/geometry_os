; DESCRIPTION: Draws a black circle centered at (196, 162) with radius 34.
; PLAN: r0=196(x), r1=162(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 162
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
