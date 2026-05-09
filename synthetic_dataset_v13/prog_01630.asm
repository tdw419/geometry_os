; DESCRIPTION: Creates a blue circular shape at (120, 77) with radius 18.
; PLAN: r0=120(x), r1=77(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 77
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
