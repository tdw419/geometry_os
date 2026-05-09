; DESCRIPTION: Renders a cyan disk with center (264, 134) and radius 77.
; PLAN: r0=264(x), r1=134(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 134
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
