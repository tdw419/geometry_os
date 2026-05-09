; DESCRIPTION: Renders a cyan disk with center (78, 125) and radius 71.
; PLAN: r0=78(x), r1=125(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 125
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
