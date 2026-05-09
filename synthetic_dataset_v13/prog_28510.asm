; DESCRIPTION: Composite: Places a red circle of radius 30 at center (427, 37) then Sets a single cyan pixel at (261, 216).
; PLAN: r0=427(x), r1=37(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=216(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 427
LDI r1, 37
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 216
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
