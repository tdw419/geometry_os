; DESCRIPTION: Creates a blue circular shape at (76, 163) with radius 68.
; PLAN: r0=76(x), r1=163(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 163
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
