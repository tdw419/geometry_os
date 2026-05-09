; DESCRIPTION: Renders a orange disk with center (402, 149) and radius 27.
; PLAN: r0=402(x), r1=149(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 149
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
