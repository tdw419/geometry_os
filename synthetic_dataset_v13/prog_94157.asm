; DESCRIPTION: Renders a orange disk with center (449, 116) and radius 10.
; PLAN: r0=449(x), r1=116(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 116
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
