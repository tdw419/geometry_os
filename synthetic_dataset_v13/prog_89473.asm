; DESCRIPTION: Places a blue circle of radius 49 at center (221, 76).
; PLAN: r0=221(x), r1=76(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 76
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
