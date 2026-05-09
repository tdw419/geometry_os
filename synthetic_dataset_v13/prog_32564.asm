; DESCRIPTION: Renders a yellow disk with center (296, 80) and radius 47.
; PLAN: r0=296(x), r1=80(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 80
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
