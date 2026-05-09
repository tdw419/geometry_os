; DESCRIPTION: Composite: Sets a single yellow pixel at (215, 182) then Draws a green line from (75, 234) to (447, 175).
; PLAN: r0=215(x), r1=182(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=75(x1), r6=234(y1), r7=447(x2), r8=175(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 182
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 234
LDI r7, 447
LDI r8, 175
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
