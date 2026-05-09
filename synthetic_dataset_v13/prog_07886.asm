; DESCRIPTION: Renders a yellow disk with center (332, 220) and radius 36.
; PLAN: r0=332(x), r1=220(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 220
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
