; DESCRIPTION: Composite: Places a red dot at position (324, 186) then Draws a cyan line from (439, 16) to (369, 75).
; PLAN: r0=324(x), r1=186(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=439(x1), r6=16(y1), r7=369(x2), r8=75(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 186
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 439
LDI r6, 16
LDI r7, 369
LDI r8, 75
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
