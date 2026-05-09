; DESCRIPTION: Draws a black circle centered at (180, 99) with radius 13.
; PLAN: r0=180(x), r1=99(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 99
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
