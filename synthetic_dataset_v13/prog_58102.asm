; DESCRIPTION: Renders a orange disk with center (273, 98) and radius 35.
; PLAN: r0=273(x), r1=98(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 98
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
