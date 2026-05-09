; DESCRIPTION: Renders a cyan disk with center (358, 116) and radius 54.
; PLAN: r0=358(x), r1=116(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 116
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
