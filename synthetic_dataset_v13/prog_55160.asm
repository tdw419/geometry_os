; DESCRIPTION: Renders a orange disk with center (96, 86) and radius 77.
; PLAN: r0=96(x), r1=86(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 86
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
