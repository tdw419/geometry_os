; DESCRIPTION: Renders a yellow disk with center (75, 125) and radius 45.
; PLAN: r0=75(x), r1=125(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 125
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
