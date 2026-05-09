; DESCRIPTION: Renders a orange disk with center (273, 53) and radius 50.
; PLAN: r0=273(x), r1=53(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 53
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
