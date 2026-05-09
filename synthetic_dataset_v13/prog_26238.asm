; DESCRIPTION: Composite: Places a orange dot at position (30, 212) then Places a cyan line segment connecting (155, 177) to (229, 137).
; PLAN: r0=30(x), r1=212(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=155(x1), r6=177(y1), r7=229(x2), r8=137(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 212
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 155
LDI r6, 177
LDI r7, 229
LDI r8, 137
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
