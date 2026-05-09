; DESCRIPTION: Draws a magenta line from (339, 223) to (13, 105).
; PLAN: r0=339(x1), r1=223(y1), r2=13(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 223
LDI r2, 13
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
