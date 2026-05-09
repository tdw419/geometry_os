; DESCRIPTION: Places a blue circle of radius 36 at center (349, 87).
; PLAN: r0=349(x), r1=87(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 87
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
