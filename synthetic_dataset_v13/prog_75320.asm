; DESCRIPTION: Creates a purple circular shape at (420, 174) with radius 23.
; PLAN: r0=420(x), r1=174(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 174
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
