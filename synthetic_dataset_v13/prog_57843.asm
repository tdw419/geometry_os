; DESCRIPTION: Places a yellow circle of radius 78 at center (389, 128).
; PLAN: r0=389(x), r1=128(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 128
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
