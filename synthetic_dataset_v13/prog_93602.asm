; DESCRIPTION: Creates a blue circular shape at (447, 120) with radius 39.
; PLAN: r0=447(x), r1=120(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 120
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
