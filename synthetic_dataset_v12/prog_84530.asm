; DESCRIPTION: Draws a red line from (355, 200) to (207, 158).
; PLAN: r0=355(x1), r1=200(y1), r2=207(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 200
LDI r2, 207
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
