; DESCRIPTION: Composite: Places a purple dot at position (296, 70) then Renders a magenta line between points (155, 90) and (12, 157).
; PLAN: r0=296(x), r1=70(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=155(x1), r6=90(y1), r7=12(x2), r8=157(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 70
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 155
LDI r6, 90
LDI r7, 12
LDI r8, 157
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
