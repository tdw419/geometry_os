; DESCRIPTION: Places a blue circle of radius 22 at center (471, 134).
; PLAN: r0=471(x), r1=134(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 134
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
