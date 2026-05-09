; DESCRIPTION: Draws a black circle centered at (175, 207) with radius 18.
; PLAN: r0=175(x), r1=207(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 207
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
