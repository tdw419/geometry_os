; DESCRIPTION: Places a orange circle of radius 58 at center (282, 109).
; PLAN: r0=282(x), r1=109(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 109
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
