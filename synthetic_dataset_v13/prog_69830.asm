; DESCRIPTION: Composite: Places a black circle of radius 40 at center (292, 108) then Places a red dot at position (276, 179).
; PLAN: r0=292(x), r1=108(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x), r6=179(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 108
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 179
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
