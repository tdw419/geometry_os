; DESCRIPTION: Composite: Sets a single red pixel at (314, 211) then Draws a cyan line from (8, 207) to (159, 38).
; PLAN: r0=314(x), r1=211(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=207(y1), r7=159(x2), r8=38(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 211
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 8
LDI r6, 207
LDI r7, 159
LDI r8, 38
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
