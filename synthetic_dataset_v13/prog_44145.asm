; DESCRIPTION: Renders a orange disk with center (77, 115) and radius 74.
; PLAN: r0=77(x), r1=115(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 115
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
