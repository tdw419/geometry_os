; DESCRIPTION: Draws a green line from (102, 216) to (311, 110).
; PLAN: r0=102(x1), r1=216(y1), r2=311(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 216
LDI r2, 311
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
