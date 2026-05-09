; DESCRIPTION: Composite: Places a white circle of radius 31 at center (98, 186) then Places a red dot at position (332, 66).
; PLAN: r0=98(x), r1=186(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=66(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 98
LDI r1, 186
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 66
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
