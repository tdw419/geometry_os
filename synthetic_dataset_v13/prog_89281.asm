; DESCRIPTION: Creates a blue circular shape at (70, 93) with radius 69.
; PLAN: r0=70(x), r1=93(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 93
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
