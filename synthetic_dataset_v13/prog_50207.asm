; DESCRIPTION: Creates a blue circular shape at (367, 131) with radius 52.
; PLAN: r0=367(x), r1=131(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 131
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
