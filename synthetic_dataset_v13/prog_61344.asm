; DESCRIPTION: Composite: Sets a single green pixel at (3, 176) then Draws a white line from (97, 117) to (314, 87).
; PLAN: r0=3(x), r1=176(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=117(y1), r7=314(x2), r8=87(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 176
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 97
LDI r6, 117
LDI r7, 314
LDI r8, 87
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
