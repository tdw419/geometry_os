; DESCRIPTION: Renders a orange disk with center (134, 190) and radius 15.
; PLAN: r0=134(x), r1=190(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 190
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
