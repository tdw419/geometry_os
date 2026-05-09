; DESCRIPTION: Composite: Sets a single magenta pixel at (292, 115) then Renders a magenta line between points (192, 228) and (432, 56).
; PLAN: r0=292(x), r1=115(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=228(y1), r7=432(x2), r8=56(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 115
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 228
LDI r7, 432
LDI r8, 56
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
