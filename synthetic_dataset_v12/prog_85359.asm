; DESCRIPTION: Creates a blue circular shape at (46, 56) with radius 35.
; PLAN: r0=46(x), r1=56(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 56
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
