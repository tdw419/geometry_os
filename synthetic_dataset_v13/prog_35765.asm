; DESCRIPTION: Renders a orange disk with center (133, 128) and radius 11.
; PLAN: r0=133(x), r1=128(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 128
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
