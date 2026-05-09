; DESCRIPTION: Creates a purple circular shape at (212, 90) with radius 67.
; PLAN: r0=212(x), r1=90(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 90
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
