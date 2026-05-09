; DESCRIPTION: Composite: Renders a cyan disk with center (174, 111) and radius 78 then Sets a single green pixel at (415, 28).
; PLAN: r0=174(x), r1=111(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 174
LDI r1, 111
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
