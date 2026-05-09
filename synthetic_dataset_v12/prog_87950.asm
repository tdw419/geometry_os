; DESCRIPTION: Renders a orange disk with center (190, 167) and radius 35.
; PLAN: r0=190(x), r1=167(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 167
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
