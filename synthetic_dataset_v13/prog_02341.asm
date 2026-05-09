; DESCRIPTION: Composite: Places a cyan dot at position (241, 182) then Places a yellow line segment connecting (411, 248) to (109, 105).
; PLAN: r0=241(x), r1=182(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=248(y1), r7=109(x2), r8=105(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 182
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 248
LDI r7, 109
LDI r8, 105
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
