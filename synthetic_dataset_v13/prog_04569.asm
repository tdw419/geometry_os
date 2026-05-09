; DESCRIPTION: Creates a purple circular shape at (117, 186) with radius 52.
; PLAN: r0=117(x), r1=186(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 186
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
