; DESCRIPTION: Composite: Places a magenta dot at position (402, 89) then Draws a magenta line from (113, 145) to (155, 83).
; PLAN: r0=402(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=113(x1), r6=145(y1), r7=155(x2), r8=83(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 113
LDI r6, 145
LDI r7, 155
LDI r8, 83
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
