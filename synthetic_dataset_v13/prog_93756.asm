; DESCRIPTION: Creates a blue circular shape at (162, 109) with radius 21.
; PLAN: r0=162(x), r1=109(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 109
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
