; DESCRIPTION: Renders a orange disk with center (82, 100) and radius 58.
; PLAN: r0=82(x), r1=100(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 100
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
