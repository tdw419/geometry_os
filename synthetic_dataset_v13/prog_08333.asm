; DESCRIPTION: Renders a orange disk with center (399, 162) and radius 77.
; PLAN: r0=399(x), r1=162(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 162
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
