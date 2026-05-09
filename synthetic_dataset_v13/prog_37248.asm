; DESCRIPTION: Renders a yellow disk with center (275, 172) and radius 53.
; PLAN: r0=275(x), r1=172(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 172
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
