; DESCRIPTION: Renders a orange disk with center (377, 73) and radius 46.
; PLAN: r0=377(x), r1=73(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 73
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
