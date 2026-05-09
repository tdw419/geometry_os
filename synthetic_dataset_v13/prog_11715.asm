; DESCRIPTION: Renders a orange disk with center (330, 48) and radius 35.
; PLAN: r0=330(x), r1=48(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 48
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
