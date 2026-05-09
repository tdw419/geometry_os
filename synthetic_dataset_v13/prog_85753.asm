; DESCRIPTION: Renders a red line between points (29, 65) and (351, 97).
; PLAN: r0=29(x1), r1=65(y1), r2=351(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 65
LDI r2, 351
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
