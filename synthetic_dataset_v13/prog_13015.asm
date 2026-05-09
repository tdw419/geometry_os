; DESCRIPTION: Composite: Sets a single red pixel at (317, 14) then Renders a red line between points (158, 4) and (239, 174).
; PLAN: r0=317(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=158(x1), r6=4(y1), r7=239(x2), r8=174(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 14
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 158
LDI r6, 4
LDI r7, 239
LDI r8, 174
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
