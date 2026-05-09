; DESCRIPTION: Composite: Sets a single red pixel at (263, 8) then Renders a magenta line between points (382, 187) and (379, 145).
; PLAN: r0=263(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=382(x1), r6=187(y1), r7=379(x2), r8=145(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 8
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 382
LDI r6, 187
LDI r7, 379
LDI r8, 145
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
