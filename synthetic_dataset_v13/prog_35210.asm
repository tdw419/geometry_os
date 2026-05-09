; DESCRIPTION: Renders a cyan disk with center (355, 139) and radius 80.
; PLAN: r0=355(x), r1=139(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 139
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
