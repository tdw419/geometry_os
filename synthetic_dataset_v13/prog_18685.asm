; DESCRIPTION: Renders a orange disk with center (212, 191) and radius 27.
; PLAN: r0=212(x), r1=191(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 191
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
