; DESCRIPTION: Draws a green line from (484, 155) to (309, 229).
; PLAN: r0=484(x1), r1=155(y1), r2=309(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 155
LDI r2, 309
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
