; DESCRIPTION: Renders a orange disk with center (413, 185) and radius 15.
; PLAN: r0=413(x), r1=185(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 185
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
