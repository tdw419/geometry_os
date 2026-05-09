; DESCRIPTION: Creates a blue circular shape at (252, 193) with radius 56.
; PLAN: r0=252(x), r1=193(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 193
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
