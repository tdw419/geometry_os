; DESCRIPTION: Renders a yellow disk with center (64, 139) and radius 24.
; PLAN: r0=64(x), r1=139(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 139
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
