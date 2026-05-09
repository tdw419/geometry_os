; DESCRIPTION: Renders a orange disk with center (301, 76) and radius 72.
; PLAN: r0=301(x), r1=76(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 76
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
