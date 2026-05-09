; DESCRIPTION: Draws a magenta line from (407, 36) to (484, 2).
; PLAN: r0=407(x1), r1=36(y1), r2=484(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 36
LDI r2, 484
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
