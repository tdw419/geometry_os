; DESCRIPTION: Renders a cyan disk with center (315, 134) and radius 75.
; PLAN: r0=315(x), r1=134(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 134
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
