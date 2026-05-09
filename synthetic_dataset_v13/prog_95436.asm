; DESCRIPTION: Places a orange circle of radius 63 at center (143, 109).
; PLAN: r0=143(x), r1=109(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 109
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
