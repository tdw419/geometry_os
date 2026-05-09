; DESCRIPTION: Composite: Sets a single cyan pixel at (179, 78) then Draws a red line from (246, 206) to (382, 90).
; PLAN: r0=179(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=246(x1), r6=206(y1), r7=382(x2), r8=90(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 206
LDI r7, 382
LDI r8, 90
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
