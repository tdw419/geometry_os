; DESCRIPTION: Composite: Sets a single yellow pixel at (2, 49) then Draws a red line from (504, 65) to (74, 153).
; PLAN: r0=2(x), r1=49(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=65(y1), r7=74(x2), r8=153(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 49
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 504
LDI r6, 65
LDI r7, 74
LDI r8, 153
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
