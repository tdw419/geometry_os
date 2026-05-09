; DESCRIPTION: Renders a cyan disk with center (418, 41) and radius 35.
; PLAN: r0=418(x), r1=41(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 41
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
