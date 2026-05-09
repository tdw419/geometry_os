; DESCRIPTION: Draws a magenta line from (301, 152) to (314, 232).
; PLAN: r0=301(x1), r1=152(y1), r2=314(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 152
LDI r2, 314
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
