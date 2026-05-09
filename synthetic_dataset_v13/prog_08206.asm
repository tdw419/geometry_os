; DESCRIPTION: Composite: Places a cyan dot at position (197, 252) then Places a cyan line segment connecting (26, 98) to (432, 158).
; PLAN: r0=197(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=26(x1), r6=98(y1), r7=432(x2), r8=158(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 252
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 26
LDI r6, 98
LDI r7, 432
LDI r8, 158
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
