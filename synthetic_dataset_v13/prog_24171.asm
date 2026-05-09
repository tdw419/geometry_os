; DESCRIPTION: Composite: Places a purple dot at position (276, 97) then Draws a green line from (21, 165) to (319, 6).
; PLAN: r0=276(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=165(y1), r7=319(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 97
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 21
LDI r6, 165
LDI r7, 319
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
