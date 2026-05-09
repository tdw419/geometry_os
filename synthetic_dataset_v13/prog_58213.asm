; DESCRIPTION: Composite: Sets a single cyan pixel at (366, 104) then Renders a purple line between points (196, 182) and (161, 246).
; PLAN: r0=366(x), r1=104(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=196(x1), r6=182(y1), r7=161(x2), r8=246(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 104
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 182
LDI r7, 161
LDI r8, 246
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
