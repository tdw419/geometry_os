; DESCRIPTION: Composite: Sets a single cyan pixel at (154, 238) then Draws a red line from (343, 38) to (314, 146).
; PLAN: r0=154(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=343(x1), r6=38(y1), r7=314(x2), r8=146(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 343
LDI r6, 38
LDI r7, 314
LDI r8, 146
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
