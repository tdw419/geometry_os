; DESCRIPTION: Renders a black disk with center (404, 62) and radius 24.
; PLAN: r0=404(x), r1=62(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 62
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
