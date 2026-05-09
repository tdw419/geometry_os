; DESCRIPTION: Places a purple circle of radius 55 at center (250, 128).
; PLAN: r0=250(x), r1=128(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 128
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
