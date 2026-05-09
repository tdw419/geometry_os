; DESCRIPTION: Renders a orange disk with center (393, 151) and radius 75.
; PLAN: r0=393(x), r1=151(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 151
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
