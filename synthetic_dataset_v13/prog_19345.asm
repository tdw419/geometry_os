; DESCRIPTION: Composite: Sets a single cyan pixel at (311, 146) then Places a yellow line segment connecting (428, 75) to (50, 182).
; PLAN: r0=311(x), r1=146(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=428(x1), r6=75(y1), r7=50(x2), r8=182(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 146
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 75
LDI r7, 50
LDI r8, 182
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
