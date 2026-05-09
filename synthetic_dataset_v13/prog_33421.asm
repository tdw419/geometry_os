; DESCRIPTION: Renders a yellow disk with center (463, 176) and radius 47.
; PLAN: r0=463(x), r1=176(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 176
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
