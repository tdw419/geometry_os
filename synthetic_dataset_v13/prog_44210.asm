; DESCRIPTION: Draws a red line from (158, 207) to (12, 37).
; PLAN: r0=158(x1), r1=207(y1), r2=12(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 207
LDI r2, 12
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
