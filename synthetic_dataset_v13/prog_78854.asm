; DESCRIPTION: Places a blue circle of radius 34 at center (444, 119).
; PLAN: r0=444(x), r1=119(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 119
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
