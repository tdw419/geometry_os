; DESCRIPTION: Places a blue circle of radius 52 at center (142, 103).
; PLAN: r0=142(x), r1=103(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 103
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
