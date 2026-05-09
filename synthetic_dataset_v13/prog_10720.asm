; DESCRIPTION: Renders a yellow disk with center (54, 204) and radius 41.
; PLAN: r0=54(x), r1=204(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 204
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
