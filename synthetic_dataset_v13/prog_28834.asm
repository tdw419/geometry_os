; DESCRIPTION: Renders a orange disk with center (255, 140) and radius 23.
; PLAN: r0=255(x), r1=140(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 140
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
