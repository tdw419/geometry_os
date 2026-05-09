; DESCRIPTION: Composite: Creates a green circular shape at (445, 106) with radius 53 then Places a cyan dot at position (125, 147).
; PLAN: r0=445(x), r1=106(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x), r6=147(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 445
LDI r1, 106
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 147
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
