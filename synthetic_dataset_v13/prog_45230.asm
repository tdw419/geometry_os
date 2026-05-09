; DESCRIPTION: Composite: Places a black dot at position (205, 241) then Places a cyan line segment connecting (261, 106) to (479, 97).
; PLAN: r0=205(x), r1=241(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=261(x1), r6=106(y1), r7=479(x2), r8=97(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 241
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 261
LDI r6, 106
LDI r7, 479
LDI r8, 97
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
