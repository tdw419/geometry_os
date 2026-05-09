; DESCRIPTION: Renders a yellow disk with center (345, 167) and radius 72.
; PLAN: r0=345(x), r1=167(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 167
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
