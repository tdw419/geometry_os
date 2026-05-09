; DESCRIPTION: Renders a orange disk with center (192, 82) and radius 34.
; PLAN: r0=192(x), r1=82(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 82
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
