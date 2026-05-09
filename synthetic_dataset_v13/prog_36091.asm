; DESCRIPTION: Creates a purple circular shape at (352, 69) with radius 57.
; PLAN: r0=352(x), r1=69(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 69
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
