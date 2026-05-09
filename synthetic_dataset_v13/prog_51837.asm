; DESCRIPTION: Places a purple circle of radius 56 at center (149, 65).
; PLAN: r0=149(x), r1=65(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 65
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
