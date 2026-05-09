; DESCRIPTION: Draws a magenta line from (432, 70) to (301, 94).
; PLAN: r0=432(x1), r1=70(y1), r2=301(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 70
LDI r2, 301
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
