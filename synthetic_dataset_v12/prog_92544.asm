; DESCRIPTION: Places a blue circle of radius 52 at center (70, 64).
; PLAN: r0=70(x), r1=64(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 64
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
