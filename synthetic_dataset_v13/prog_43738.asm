; DESCRIPTION: Renders a cyan disk with center (117, 139) and radius 71.
; PLAN: r0=117(x), r1=139(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 139
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
