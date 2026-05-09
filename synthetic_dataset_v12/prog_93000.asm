; DESCRIPTION: Draws a magenta line from (261, 102) to (133, 188).
; PLAN: r0=261(x1), r1=102(y1), r2=133(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 102
LDI r2, 133
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
