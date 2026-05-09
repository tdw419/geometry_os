; DESCRIPTION: Creates a blue circular shape at (161, 215) with radius 23.
; PLAN: r0=161(x), r1=215(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 215
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
