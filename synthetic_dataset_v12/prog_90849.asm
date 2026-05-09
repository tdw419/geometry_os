; DESCRIPTION: Renders a cyan disk with center (190, 49) and radius 19.
; PLAN: r0=190(x), r1=49(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 49
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
