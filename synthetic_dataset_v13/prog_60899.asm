; DESCRIPTION: Renders a cyan disk with center (396, 41) and radius 19.
; PLAN: r0=396(x), r1=41(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 41
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
