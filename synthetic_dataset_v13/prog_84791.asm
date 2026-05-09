; DESCRIPTION: Creates a black circular shape at (105, 150) with radius 60.
; PLAN: r0=105(x), r1=150(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 150
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
