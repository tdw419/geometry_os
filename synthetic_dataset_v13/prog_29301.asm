; DESCRIPTION: Draws a red line from (251, 65) to (337, 71).
; PLAN: r0=251(x1), r1=65(y1), r2=337(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 65
LDI r2, 337
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
