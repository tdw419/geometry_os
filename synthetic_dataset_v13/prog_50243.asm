; DESCRIPTION: Renders a yellow disk with center (138, 150) and radius 49.
; PLAN: r0=138(x), r1=150(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 150
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
