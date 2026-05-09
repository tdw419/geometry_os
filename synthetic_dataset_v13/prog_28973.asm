; DESCRIPTION: Composite: Sets a single orange pixel at (510, 77) then Places a cyan line segment connecting (88, 182) to (230, 64).
; PLAN: r0=510(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=88(x1), r6=182(y1), r7=230(x2), r8=64(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 77
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 88
LDI r6, 182
LDI r7, 230
LDI r8, 64
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
