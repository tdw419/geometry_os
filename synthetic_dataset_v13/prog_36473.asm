; DESCRIPTION: Composite: Sets a single red pixel at (413, 57) then Draws a yellow line from (226, 202) to (297, 96).
; PLAN: r0=413(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=226(x1), r6=202(y1), r7=297(x2), r8=96(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 226
LDI r6, 202
LDI r7, 297
LDI r8, 96
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
