; DESCRIPTION: Renders a orange disk with center (92, 151) and radius 43.
; PLAN: r0=92(x), r1=151(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 151
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
