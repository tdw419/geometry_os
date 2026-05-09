; DESCRIPTION: Places a blue circle of radius 35 at center (117, 64).
; PLAN: r0=117(x), r1=64(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 64
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
