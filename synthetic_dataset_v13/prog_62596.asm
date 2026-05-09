; DESCRIPTION: Places a orange circle of radius 68 at center (185, 136).
; PLAN: r0=185(x), r1=136(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 136
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
