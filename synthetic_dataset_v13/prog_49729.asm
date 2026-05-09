; DESCRIPTION: Composite: Places a white dot at position (375, 79) then Places a cyan line segment connecting (319, 119) to (358, 177).
; PLAN: r0=375(x), r1=79(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=119(y1), r7=358(x2), r8=177(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 79
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 119
LDI r7, 358
LDI r8, 177
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
