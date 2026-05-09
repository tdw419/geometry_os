; DESCRIPTION: Renders a orange disk with center (86, 80) and radius 54.
; PLAN: r0=86(x), r1=80(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 80
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
