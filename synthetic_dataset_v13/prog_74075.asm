; DESCRIPTION: Renders a orange disk with center (182, 102) and radius 48.
; PLAN: r0=182(x), r1=102(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 102
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
