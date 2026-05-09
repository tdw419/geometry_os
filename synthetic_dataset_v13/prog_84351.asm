; DESCRIPTION: Composite: Renders a cyan disk with center (359, 107) and radius 29 then Places a white dot at position (286, 205).
; PLAN: r0=359(x), r1=107(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=205(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 359
LDI r1, 107
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 205
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
