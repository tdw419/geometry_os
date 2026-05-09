; DESCRIPTION: Draws a red line from (216, 20) to (248, 82).
; PLAN: r0=216(x1), r1=20(y1), r2=248(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 20
LDI r2, 248
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
