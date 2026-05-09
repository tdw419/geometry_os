; DESCRIPTION: Creates a black circular shape at (366, 99) with radius 50.
; PLAN: r0=366(x), r1=99(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 99
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
