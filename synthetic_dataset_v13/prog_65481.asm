; DESCRIPTION: Renders a yellow disk with center (329, 100) and radius 25.
; PLAN: r0=329(x), r1=100(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 100
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
