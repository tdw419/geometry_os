; DESCRIPTION: Draws a red line from (196, 30) to (339, 216).
; PLAN: r0=196(x1), r1=30(y1), r2=339(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 30
LDI r2, 339
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
