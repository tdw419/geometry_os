; DESCRIPTION: Composite: Places a magenta dot at position (400, 84) then Draws a blue line from (266, 147) to (272, 71).
; PLAN: r0=400(x), r1=84(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=266(x1), r6=147(y1), r7=272(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 84
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 147
LDI r7, 272
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
