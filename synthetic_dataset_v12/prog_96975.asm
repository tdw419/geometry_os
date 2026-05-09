; DESCRIPTION: Renders a cyan disk with center (453, 139) and radius 41.
; PLAN: r0=453(x), r1=139(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 139
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
