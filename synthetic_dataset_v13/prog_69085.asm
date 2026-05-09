; DESCRIPTION: Places a purple circle of radius 14 at center (101, 186).
; PLAN: r0=101(x), r1=186(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 186
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
