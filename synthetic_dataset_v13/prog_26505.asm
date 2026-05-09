; DESCRIPTION: Renders a orange disk with center (413, 98) and radius 51.
; PLAN: r0=413(x), r1=98(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 98
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
