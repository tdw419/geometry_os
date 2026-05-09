; DESCRIPTION: Renders a cyan disk with center (328, 83) and radius 78.
; PLAN: r0=328(x), r1=83(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 83
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
