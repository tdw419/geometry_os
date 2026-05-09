; DESCRIPTION: Composite: Renders a cyan disk with center (136, 175) and radius 30 then Places a cyan dot at position (218, 78).
; PLAN: r0=136(x), r1=175(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=78(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 175
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 78
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
