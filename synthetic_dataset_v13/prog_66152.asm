; DESCRIPTION: Renders a cyan disk with center (358, 172) and radius 30.
; PLAN: r0=358(x), r1=172(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 172
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
