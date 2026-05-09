; DESCRIPTION: Renders a yellow disk with center (210, 72) and radius 15.
; PLAN: r0=210(x), r1=72(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 72
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
