; DESCRIPTION: Draws a red line from (94, 102) to (84, 170).
; PLAN: r0=94(x1), r1=102(y1), r2=84(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 102
LDI r2, 84
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
