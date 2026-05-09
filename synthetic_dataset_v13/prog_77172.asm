; DESCRIPTION: Renders a orange disk with center (379, 82) and radius 77.
; PLAN: r0=379(x), r1=82(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 82
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
