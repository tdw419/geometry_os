; DESCRIPTION: Renders a yellow disk with center (113, 35) and radius 25.
; PLAN: r0=113(x), r1=35(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 35
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
