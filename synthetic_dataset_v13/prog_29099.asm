; DESCRIPTION: Places a blue circle of radius 13 at center (352, 78).
; PLAN: r0=352(x), r1=78(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 78
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
