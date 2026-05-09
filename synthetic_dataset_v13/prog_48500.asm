; DESCRIPTION: Renders a cyan disk with center (100, 89) and radius 75.
; PLAN: r0=100(x), r1=89(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 89
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
