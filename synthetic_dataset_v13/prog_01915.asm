; DESCRIPTION: Renders a orange disk with center (220, 171) and radius 55.
; PLAN: r0=220(x), r1=171(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 171
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
