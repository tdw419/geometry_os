; DESCRIPTION: Renders a orange disk with center (182, 19) and radius 19.
; PLAN: r0=182(x), r1=19(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 19
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
