; DESCRIPTION: Renders a cyan disk with center (157, 89) and radius 56.
; PLAN: r0=157(x), r1=89(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 89
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
