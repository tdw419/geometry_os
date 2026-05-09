; DESCRIPTION: Renders a red line between points (276, 87) and (250, 144).
; PLAN: r0=276(x1), r1=87(y1), r2=250(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 87
LDI r2, 250
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
