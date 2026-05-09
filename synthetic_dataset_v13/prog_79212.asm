; DESCRIPTION: Renders a cyan disk with center (334, 39) and radius 20.
; PLAN: r0=334(x), r1=39(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 39
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
