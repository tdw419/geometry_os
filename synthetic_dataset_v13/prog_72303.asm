; DESCRIPTION: Creates a purple circular shape at (369, 180) with radius 40.
; PLAN: r0=369(x), r1=180(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 180
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
