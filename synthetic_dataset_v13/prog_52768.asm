; DESCRIPTION: Renders a red line between points (351, 202) and (49, 231).
; PLAN: r0=351(x1), r1=202(y1), r2=49(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 202
LDI r2, 49
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
