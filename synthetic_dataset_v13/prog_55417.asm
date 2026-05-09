; DESCRIPTION: Renders a yellow disk with center (334, 117) and radius 57.
; PLAN: r0=334(x), r1=117(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 117
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
