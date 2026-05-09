; DESCRIPTION: Places a purple circle of radius 26 at center (103, 85).
; PLAN: r0=103(x), r1=85(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 85
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
