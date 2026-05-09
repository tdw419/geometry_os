; DESCRIPTION: Renders a cyan disk with center (339, 113) and radius 60.
; PLAN: r0=339(x), r1=113(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 113
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
