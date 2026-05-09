; DESCRIPTION: Renders a orange disk with center (134, 127) and radius 56.
; PLAN: r0=134(x), r1=127(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 127
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
