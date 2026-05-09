; DESCRIPTION: Composite: Sets a single red pixel at (414, 35) then Draws a red line from (279, 102) to (404, 150).
; PLAN: r0=414(x), r1=35(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=102(y1), r7=404(x2), r8=150(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 35
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 279
LDI r6, 102
LDI r7, 404
LDI r8, 150
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
