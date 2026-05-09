; DESCRIPTION: Places a orange circle of radius 78 at center (185, 148).
; PLAN: r0=185(x), r1=148(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 148
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
