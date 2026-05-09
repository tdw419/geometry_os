; DESCRIPTION: Renders a red disk with center (204, 113) and radius 50.
; PLAN: r0=204(x), r1=113(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 113
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
