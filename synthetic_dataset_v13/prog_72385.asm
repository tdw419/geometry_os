; DESCRIPTION: Creates a blue circular shape at (161, 109) with radius 12.
; PLAN: r0=161(x), r1=109(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 109
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
