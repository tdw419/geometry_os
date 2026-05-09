; DESCRIPTION: Renders a orange disk with center (290, 106) and radius 67.
; PLAN: r0=290(x), r1=106(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 106
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
