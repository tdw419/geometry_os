; DESCRIPTION: Renders a orange disk with center (153, 77) and radius 16.
; PLAN: r0=153(x), r1=77(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 77
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
