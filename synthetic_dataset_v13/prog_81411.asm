; DESCRIPTION: Composite: Sets a single black pixel at (151, 97) then Draws a red line from (331, 155) to (298, 66).
; PLAN: r0=151(x), r1=97(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=155(y1), r7=298(x2), r8=66(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 97
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 331
LDI r6, 155
LDI r7, 298
LDI r8, 66
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
