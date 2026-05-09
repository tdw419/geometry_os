; DESCRIPTION: Renders a purple disk with center (296, 80) and radius 60.
; PLAN: r0=296(x), r1=80(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 80
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
