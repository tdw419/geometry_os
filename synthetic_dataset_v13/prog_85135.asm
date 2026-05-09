; DESCRIPTION: Renders a orange disk with center (372, 145) and radius 53.
; PLAN: r0=372(x), r1=145(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 145
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
