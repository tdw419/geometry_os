; DESCRIPTION: Renders a orange disk with center (443, 66) and radius 64.
; PLAN: r0=443(x), r1=66(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 66
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
