; DESCRIPTION: Draws a red line from (466, 243) to (37, 75).
; PLAN: r0=466(x1), r1=243(y1), r2=37(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 243
LDI r2, 37
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
