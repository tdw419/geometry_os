; DESCRIPTION: Renders a yellow disk with center (377, 149) and radius 74.
; PLAN: r0=377(x), r1=149(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 149
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
