; DESCRIPTION: Creates a blue circular shape at (168, 118) with radius 69.
; PLAN: r0=168(x), r1=118(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 118
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
