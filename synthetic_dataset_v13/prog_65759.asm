; DESCRIPTION: Places a blue circle of radius 34 at center (95, 158).
; PLAN: r0=95(x), r1=158(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 158
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
