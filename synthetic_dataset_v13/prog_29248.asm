; DESCRIPTION: Renders a orange disk with center (350, 101) and radius 61.
; PLAN: r0=350(x), r1=101(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 101
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
