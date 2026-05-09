; DESCRIPTION: Renders a black disk with center (296, 94) and radius 50.
; PLAN: r0=296(x), r1=94(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 94
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
