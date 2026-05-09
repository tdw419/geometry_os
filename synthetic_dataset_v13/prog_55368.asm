; DESCRIPTION: Draws a magenta line from (150, 132) to (389, 133).
; PLAN: r0=150(x1), r1=132(y1), r2=389(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 132
LDI r2, 389
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
