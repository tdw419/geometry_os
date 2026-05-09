; DESCRIPTION: Renders a red disk with center (422, 169) and radius 41.
; PLAN: r0=422(x), r1=169(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 169
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
