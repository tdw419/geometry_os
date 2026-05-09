; DESCRIPTION: Places a orange circle of radius 49 at center (132, 136).
; PLAN: r0=132(x), r1=136(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 136
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
