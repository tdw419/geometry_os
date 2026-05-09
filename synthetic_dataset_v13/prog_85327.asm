; DESCRIPTION: Renders a cyan disk with center (83, 89) and radius 50.
; PLAN: r0=83(x), r1=89(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 89
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
