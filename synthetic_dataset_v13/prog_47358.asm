; DESCRIPTION: Creates a blue circular shape at (254, 208) with radius 47.
; PLAN: r0=254(x), r1=208(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 208
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
