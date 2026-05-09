; DESCRIPTION: Renders a orange disk with center (407, 120) and radius 60.
; PLAN: r0=407(x), r1=120(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 120
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
