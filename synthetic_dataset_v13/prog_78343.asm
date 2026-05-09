; DESCRIPTION: Draws a magenta line from (330, 190) to (252, 136).
; PLAN: r0=330(x1), r1=190(y1), r2=252(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 190
LDI r2, 252
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
