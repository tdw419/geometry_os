; DESCRIPTION: Creates a blue circular shape at (367, 148) with radius 73.
; PLAN: r0=367(x), r1=148(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 148
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
