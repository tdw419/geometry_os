; DESCRIPTION: Renders a orange disk with center (72, 134) and radius 70.
; PLAN: r0=72(x), r1=134(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 134
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
