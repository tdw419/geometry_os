; DESCRIPTION: Renders a cyan disk with center (80, 86) and radius 41.
; PLAN: r0=80(x), r1=86(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 86
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
