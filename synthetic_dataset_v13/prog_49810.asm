; DESCRIPTION: Composite: Renders a cyan disk with center (250, 74) and radius 15 then Places a cyan dot at position (359, 106).
; PLAN: r0=250(x), r1=74(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=106(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 74
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 106
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
