; DESCRIPTION: Creates a purple circular shape at (216, 134) with radius 27.
; PLAN: r0=216(x), r1=134(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 134
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
