; DESCRIPTION: Creates a blue circular shape at (107, 18) with radius 17.
; PLAN: r0=107(x), r1=18(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 18
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
