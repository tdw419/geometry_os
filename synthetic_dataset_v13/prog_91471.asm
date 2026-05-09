; DESCRIPTION: Places a blue circle of radius 33 at center (387, 105).
; PLAN: r0=387(x), r1=105(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 105
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
