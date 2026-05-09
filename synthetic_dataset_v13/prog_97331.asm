; DESCRIPTION: Places a blue circle of radius 52 at center (69, 80).
; PLAN: r0=69(x), r1=80(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 80
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
