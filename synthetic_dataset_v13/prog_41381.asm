; DESCRIPTION: Places a blue circle of radius 79 at center (227, 150).
; PLAN: r0=227(x), r1=150(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 150
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
