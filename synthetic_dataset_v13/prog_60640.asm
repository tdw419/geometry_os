; DESCRIPTION: Renders a orange disk with center (138, 187) and radius 68.
; PLAN: r0=138(x), r1=187(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 187
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
