; DESCRIPTION: Places a purple circle of radius 41 at center (179, 196).
; PLAN: r0=179(x), r1=196(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 196
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
