; DESCRIPTION: Renders a red line between points (427, 156) and (381, 27).
; PLAN: r0=427(x1), r1=156(y1), r2=381(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 156
LDI r2, 381
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
