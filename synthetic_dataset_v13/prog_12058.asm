; DESCRIPTION: Draws a red line from (33, 119) to (98, 97).
; PLAN: r0=33(x1), r1=119(y1), r2=98(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 119
LDI r2, 98
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
