; DESCRIPTION: Draws a red line from (337, 104) to (89, 216).
; PLAN: r0=337(x1), r1=104(y1), r2=89(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 104
LDI r2, 89
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
