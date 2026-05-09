; DESCRIPTION: Renders a orange disk with center (455, 53) and radius 37.
; PLAN: r0=455(x), r1=53(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 53
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
