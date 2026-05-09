; DESCRIPTION: Places a blue circle of radius 43 at center (112, 157).
; PLAN: r0=112(x), r1=157(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 157
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
