; DESCRIPTION: Places a blue circle of radius 54 at center (231, 85).
; PLAN: r0=231(x), r1=85(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 85
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
