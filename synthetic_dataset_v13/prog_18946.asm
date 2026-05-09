; DESCRIPTION: Renders a cyan disk with center (318, 78) and radius 33.
; PLAN: r0=318(x), r1=78(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 78
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
