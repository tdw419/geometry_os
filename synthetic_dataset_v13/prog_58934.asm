; DESCRIPTION: Places a purple circle of radius 54 at center (171, 101).
; PLAN: r0=171(x), r1=101(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 101
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
