; DESCRIPTION: Renders a yellow disk with center (375, 151) and radius 56.
; PLAN: r0=375(x), r1=151(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 151
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
