; DESCRIPTION: Draws a black circle centered at (366, 50) with radius 40.
; PLAN: r0=366(x), r1=50(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 50
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
