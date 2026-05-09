; DESCRIPTION: Creates a blue circular shape at (413, 123) with radius 44.
; PLAN: r0=413(x), r1=123(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 123
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
