; DESCRIPTION: Composite: Sets a single black pixel at (34, 194) then Draws a cyan line from (63, 125) to (297, 167).
; PLAN: r0=34(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=63(x1), r6=125(y1), r7=297(x2), r8=167(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 63
LDI r6, 125
LDI r7, 297
LDI r8, 167
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
