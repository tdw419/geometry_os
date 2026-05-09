; DESCRIPTION: Renders a cyan disk with center (178, 89) and radius 24.
; PLAN: r0=178(x), r1=89(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 89
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
