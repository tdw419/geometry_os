; DESCRIPTION: Renders a orange disk with center (221, 161) and radius 62.
; PLAN: r0=221(x), r1=161(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 161
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
