; DESCRIPTION: Places a red line segment connecting (349, 87) to (65, 147).
; PLAN: r0=349(x1), r1=87(y1), r2=65(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 87
LDI r2, 65
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
