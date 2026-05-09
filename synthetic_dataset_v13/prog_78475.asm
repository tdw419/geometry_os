; DESCRIPTION: Draws a black circle centered at (210, 97) with radius 14.
; PLAN: r0=210(x), r1=97(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 97
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
