; DESCRIPTION: Renders a yellow disk with center (332, 115) and radius 48.
; PLAN: r0=332(x), r1=115(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 115
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
