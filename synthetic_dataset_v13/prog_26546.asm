; DESCRIPTION: Renders a yellow disk with center (296, 81) and radius 48.
; PLAN: r0=296(x), r1=81(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 81
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
