; DESCRIPTION: Renders a yellow disk with center (383, 100) and radius 14.
; PLAN: r0=383(x), r1=100(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 100
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
