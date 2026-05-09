; DESCRIPTION: Places a blue circle of radius 25 at center (325, 103).
; PLAN: r0=325(x), r1=103(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 103
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
