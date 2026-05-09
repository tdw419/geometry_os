; DESCRIPTION: Renders a orange disk with center (126, 118) and radius 27.
; PLAN: r0=126(x), r1=118(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 118
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
