; DESCRIPTION: Places a yellow circle of radius 30 at center (35, 133).
; PLAN: r0=35(x), r1=133(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 133
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
