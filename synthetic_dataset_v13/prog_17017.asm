; DESCRIPTION: Renders a orange disk with center (140, 180) and radius 10.
; PLAN: r0=140(x), r1=180(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 180
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
