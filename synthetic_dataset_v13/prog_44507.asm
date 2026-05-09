; DESCRIPTION: Draws a green line from (212, 178) to (451, 52).
; PLAN: r0=212(x1), r1=178(y1), r2=451(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 178
LDI r2, 451
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
