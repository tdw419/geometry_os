; DESCRIPTION: Places a blue circle of radius 47 at center (387, 66).
; PLAN: r0=387(x), r1=66(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 66
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
