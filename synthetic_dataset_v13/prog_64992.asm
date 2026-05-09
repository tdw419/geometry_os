; DESCRIPTION: Draws a red line from (351, 78) to (54, 182).
; PLAN: r0=351(x1), r1=78(y1), r2=54(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 78
LDI r2, 54
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
