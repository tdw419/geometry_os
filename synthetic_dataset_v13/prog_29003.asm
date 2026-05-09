; DESCRIPTION: Places a blue circle of radius 23 at center (158, 220).
; PLAN: r0=158(x), r1=220(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 220
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
