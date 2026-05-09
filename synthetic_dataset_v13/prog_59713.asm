; DESCRIPTION: Renders a yellow disk with center (154, 167) and radius 53.
; PLAN: r0=154(x), r1=167(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 167
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
