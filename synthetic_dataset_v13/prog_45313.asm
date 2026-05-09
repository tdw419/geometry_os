; DESCRIPTION: Creates a purple circular shape at (186, 185) with radius 59.
; PLAN: r0=186(x), r1=185(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 185
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
