; DESCRIPTION: Renders a red disk with center (41, 29) and radius 24.
; PLAN: r0=41(x), r1=29(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 29
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
