; DESCRIPTION: Renders a yellow disk with center (167, 49) and radius 18.
; PLAN: r0=167(x), r1=49(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 49
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
