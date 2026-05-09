; DESCRIPTION: Places a blue circle of radius 39 at center (432, 133).
; PLAN: r0=432(x), r1=133(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 133
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
