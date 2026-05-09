; DESCRIPTION: Composite: Sets a single red pixel at (58, 166) then Draws a red line from (129, 73) to (395, 127).
; PLAN: r0=58(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=129(x1), r6=73(y1), r7=395(x2), r8=127(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 129
LDI r6, 73
LDI r7, 395
LDI r8, 127
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
