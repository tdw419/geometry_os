; DESCRIPTION: Composite: Sets a single cyan pixel at (358, 44) then Places a purple line segment connecting (286, 245) to (225, 107).
; PLAN: r0=358(x), r1=44(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=286(x1), r6=245(y1), r7=225(x2), r8=107(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 44
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 286
LDI r6, 245
LDI r7, 225
LDI r8, 107
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
