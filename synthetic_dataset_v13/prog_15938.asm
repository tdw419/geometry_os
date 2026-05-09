; DESCRIPTION: Renders a red disk with center (54, 48) and radius 41.
; PLAN: r0=54(x), r1=48(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 48
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
