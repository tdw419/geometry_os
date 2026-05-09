; DESCRIPTION: Places a blue circle of radius 10 at center (64, 216).
; PLAN: r0=64(x), r1=216(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 216
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
