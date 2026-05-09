; DESCRIPTION: Places a purple circle of radius 60 at center (302, 118).
; PLAN: r0=302(x), r1=118(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 118
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
