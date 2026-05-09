; DESCRIPTION: Draws a yellow line from (299, 133) to (229, 94).
; PLAN: r0=299(x1), r1=133(y1), r2=229(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 133
LDI r2, 229
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
