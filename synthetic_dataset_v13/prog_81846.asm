; DESCRIPTION: Places a blue circle of radius 71 at center (427, 184).
; PLAN: r0=427(x), r1=184(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 184
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
