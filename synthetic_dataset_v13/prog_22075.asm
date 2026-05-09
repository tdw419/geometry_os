; DESCRIPTION: Creates a purple circular shape at (292, 44) with radius 16.
; PLAN: r0=292(x), r1=44(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 44
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
