; DESCRIPTION: Composite: Places a cyan dot at position (174, 163) then Renders a purple disk with center (375, 190) and radius 44.
; PLAN: r0=174(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=190(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 174
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 190
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
