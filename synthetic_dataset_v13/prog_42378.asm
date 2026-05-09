; DESCRIPTION: Creates a purple circular shape at (164, 127) with radius 67.
; PLAN: r0=164(x), r1=127(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 127
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
