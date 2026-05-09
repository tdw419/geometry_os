; DESCRIPTION: Composite: Renders a cyan disk with center (64, 183) and radius 57 then Sets a single green pixel at (297, 180).
; PLAN: r0=64(x), r1=183(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=180(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 64
LDI r1, 183
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 180
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
