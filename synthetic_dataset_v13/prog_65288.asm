; DESCRIPTION: Creates a purple circular shape at (168, 139) with radius 75.
; PLAN: r0=168(x), r1=139(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 139
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
