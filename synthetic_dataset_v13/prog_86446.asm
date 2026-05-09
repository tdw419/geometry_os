; DESCRIPTION: Renders a cyan disk with center (389, 78) and radius 23.
; PLAN: r0=389(x), r1=78(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 78
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
