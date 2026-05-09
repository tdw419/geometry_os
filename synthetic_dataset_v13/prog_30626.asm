; DESCRIPTION: Renders a yellow disk with center (451, 125) and radius 33.
; PLAN: r0=451(x), r1=125(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 125
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
