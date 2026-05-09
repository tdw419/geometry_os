; DESCRIPTION: Renders a red disk with center (260, 209) and radius 41.
; PLAN: r0=260(x), r1=209(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 209
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
