; DESCRIPTION: Draws a magenta line from (458, 252) to (188, 33).
; PLAN: r0=458(x1), r1=252(y1), r2=188(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 252
LDI r2, 188
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
