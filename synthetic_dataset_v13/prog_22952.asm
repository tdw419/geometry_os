; DESCRIPTION: Draws a red line from (335, 13) to (303, 3).
; PLAN: r0=335(x1), r1=13(y1), r2=303(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 13
LDI r2, 303
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
