; DESCRIPTION: Draws a red line from (417, 77) to (377, 69).
; PLAN: r0=417(x1), r1=77(y1), r2=377(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 77
LDI r2, 377
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
