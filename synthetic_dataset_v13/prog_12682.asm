; DESCRIPTION: Renders a orange disk with center (46, 72) and radius 43.
; PLAN: r0=46(x), r1=72(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 72
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
