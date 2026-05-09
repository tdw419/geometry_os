; DESCRIPTION: Places a purple circle of radius 75 at center (313, 161).
; PLAN: r0=313(x), r1=161(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 161
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
