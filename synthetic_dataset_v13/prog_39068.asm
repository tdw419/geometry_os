; DESCRIPTION: Renders a cyan disk with center (261, 105) and radius 76.
; PLAN: r0=261(x), r1=105(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 105
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
