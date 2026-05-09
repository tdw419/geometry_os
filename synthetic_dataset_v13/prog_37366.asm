; DESCRIPTION: Draws a magenta line from (314, 126) to (349, 88).
; PLAN: r0=314(x1), r1=126(y1), r2=349(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 126
LDI r2, 349
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
