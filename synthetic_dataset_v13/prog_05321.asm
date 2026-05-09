; DESCRIPTION: Composite: Sets a single black pixel at (182, 156) then Draws a cyan line from (104, 168) to (341, 80).
; PLAN: r0=182(x), r1=156(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=104(x1), r6=168(y1), r7=341(x2), r8=80(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 156
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 104
LDI r6, 168
LDI r7, 341
LDI r8, 80
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
