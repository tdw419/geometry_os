; DESCRIPTION: Composite: Places a green dot at position (118, 63) then Renders a black line between points (489, 97) and (163, 135).
; PLAN: r0=118(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=489(x1), r6=97(y1), r7=163(x2), r8=135(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 63
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 489
LDI r6, 97
LDI r7, 163
LDI r8, 135
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
