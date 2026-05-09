; DESCRIPTION: Draws a black circle centered at (366, 84) with radius 50.
; PLAN: r0=366(x), r1=84(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 84
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
