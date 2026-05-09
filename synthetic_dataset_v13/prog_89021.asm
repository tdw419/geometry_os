; DESCRIPTION: Places a orange circle of radius 29 at center (211, 136).
; PLAN: r0=211(x), r1=136(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 136
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
