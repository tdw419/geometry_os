; DESCRIPTION: Renders a yellow disk with center (283, 134) and radius 27.
; PLAN: r0=283(x), r1=134(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 134
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
