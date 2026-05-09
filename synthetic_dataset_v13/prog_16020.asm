; DESCRIPTION: Places a blue circle of radius 16 at center (385, 37).
; PLAN: r0=385(x), r1=37(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 37
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
