; DESCRIPTION: Places a purple circle of radius 73 at center (174, 145).
; PLAN: r0=174(x), r1=145(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 145
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
