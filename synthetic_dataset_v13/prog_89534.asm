; DESCRIPTION: Renders a orange disk with center (421, 160) and radius 61.
; PLAN: r0=421(x), r1=160(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 160
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
