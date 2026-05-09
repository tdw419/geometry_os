; DESCRIPTION: Creates a blue circular shape at (56, 56) with radius 46.
; PLAN: r0=56(x), r1=56(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 56
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
