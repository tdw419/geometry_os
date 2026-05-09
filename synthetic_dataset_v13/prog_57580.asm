; DESCRIPTION: Draws a green line from (36, 158) to (258, 78).
; PLAN: r0=36(x1), r1=158(y1), r2=258(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 158
LDI r2, 258
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
