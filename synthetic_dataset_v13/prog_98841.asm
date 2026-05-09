; DESCRIPTION: Creates a purple circular shape at (369, 120) with radius 12.
; PLAN: r0=369(x), r1=120(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 120
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
