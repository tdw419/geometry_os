; DESCRIPTION: Renders a cyan disk with center (49, 191) and radius 34.
; PLAN: r0=49(x), r1=191(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 191
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
