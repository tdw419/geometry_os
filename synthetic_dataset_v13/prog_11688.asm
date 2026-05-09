; DESCRIPTION: Places a blue circle of radius 74 at center (366, 85).
; PLAN: r0=366(x), r1=85(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 85
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
