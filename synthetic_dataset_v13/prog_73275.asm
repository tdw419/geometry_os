; DESCRIPTION: Renders a black disk with center (404, 161) and radius 49.
; PLAN: r0=404(x), r1=161(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 161
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
