; DESCRIPTION: Places a blue circle of radius 21 at center (432, 56).
; PLAN: r0=432(x), r1=56(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 56
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
