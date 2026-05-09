; DESCRIPTION: Creates a purple circular shape at (450, 47) with radius 47.
; PLAN: r0=450(x), r1=47(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 47
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
