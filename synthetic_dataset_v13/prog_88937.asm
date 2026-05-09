; DESCRIPTION: Composite: Renders a white disk with center (178, 144) and radius 65 then Places a cyan dot at position (423, 78).
; PLAN: r0=178(x), r1=144(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=78(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 144
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 78
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
