; DESCRIPTION: Places a blue circle of radius 31 at center (288, 191).
; PLAN: r0=288(x), r1=191(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 191
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
