; DESCRIPTION: Places a purple circle of radius 79 at center (283, 153).
; PLAN: r0=283(x), r1=153(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 153
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
