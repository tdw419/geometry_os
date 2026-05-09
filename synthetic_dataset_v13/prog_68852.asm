; DESCRIPTION: Draws a red line from (251, 243) to (55, 34).
; PLAN: r0=251(x1), r1=243(y1), r2=55(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 243
LDI r2, 55
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
