; DESCRIPTION: Places a blue circle of radius 10 at center (85, 158).
; PLAN: r0=85(x), r1=158(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 158
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
