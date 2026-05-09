; DESCRIPTION: Renders a orange disk with center (377, 133) and radius 63.
; PLAN: r0=377(x), r1=133(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 133
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
