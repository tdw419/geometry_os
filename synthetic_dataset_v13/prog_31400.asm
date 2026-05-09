; DESCRIPTION: Draws a green line from (118, 178) to (451, 167).
; PLAN: r0=118(x1), r1=178(y1), r2=451(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 178
LDI r2, 451
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
