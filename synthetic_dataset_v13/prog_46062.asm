; DESCRIPTION: Renders a orange disk with center (458, 120) and radius 19.
; PLAN: r0=458(x), r1=120(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 120
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
