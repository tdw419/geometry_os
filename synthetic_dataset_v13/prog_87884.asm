; DESCRIPTION: Creates a blue circular shape at (102, 150) with radius 73.
; PLAN: r0=102(x), r1=150(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 150
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
