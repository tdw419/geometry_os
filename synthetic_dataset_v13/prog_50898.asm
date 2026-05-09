; DESCRIPTION: Creates a blue circular shape at (247, 64) with radius 52.
; PLAN: r0=247(x), r1=64(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 64
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
