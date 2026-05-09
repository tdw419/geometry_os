; DESCRIPTION: Places a purple circle of radius 10 at center (38, 74).
; PLAN: r0=38(x), r1=74(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 74
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
