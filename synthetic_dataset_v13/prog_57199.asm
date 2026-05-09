; DESCRIPTION: Draws a red line from (260, 78) to (248, 93).
; PLAN: r0=260(x1), r1=78(y1), r2=248(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 78
LDI r2, 248
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
