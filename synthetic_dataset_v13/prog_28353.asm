; DESCRIPTION: Composite: Sets a single red pixel at (450, 180) then Draws a red line from (9, 168) to (176, 3).
; PLAN: r0=450(x), r1=180(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=9(x1), r6=168(y1), r7=176(x2), r8=3(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 450
LDI r1, 180
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 9
LDI r6, 168
LDI r7, 176
LDI r8, 3
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
