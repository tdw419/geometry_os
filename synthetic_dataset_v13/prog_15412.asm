; DESCRIPTION: Renders a cyan disk with center (276, 105) and radius 78.
; PLAN: r0=276(x), r1=105(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 105
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
