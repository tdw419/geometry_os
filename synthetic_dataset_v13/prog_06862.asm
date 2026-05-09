; DESCRIPTION: Draws a magenta line from (71, 212) to (450, 84).
; PLAN: r0=71(x1), r1=212(y1), r2=450(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 212
LDI r2, 450
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
