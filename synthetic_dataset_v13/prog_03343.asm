; DESCRIPTION: Creates a blue circular shape at (295, 109) with radius 66.
; PLAN: r0=295(x), r1=109(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 109
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
