; DESCRIPTION: Renders a red disk with center (399, 41) and radius 29.
; PLAN: r0=399(x), r1=41(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 41
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
