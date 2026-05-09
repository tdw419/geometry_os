; DESCRIPTION: Renders a orange disk with center (114, 92) and radius 18.
; PLAN: r0=114(x), r1=92(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 92
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
