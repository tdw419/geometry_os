; DESCRIPTION: Composite: Places a orange dot at position (484, 245) then Places a cyan line segment connecting (358, 169) to (336, 176).
; PLAN: r0=484(x), r1=245(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=169(y1), r7=336(x2), r8=176(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 245
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 358
LDI r6, 169
LDI r7, 336
LDI r8, 176
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
