; DESCRIPTION: Renders a red line between points (150, 248) and (194, 205).
; PLAN: r0=150(x1), r1=248(y1), r2=194(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 248
LDI r2, 194
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
