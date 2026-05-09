; DESCRIPTION: Draws a magenta line from (63, 69) to (84, 68).
; PLAN: r0=63(x1), r1=69(y1), r2=84(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 69
LDI r2, 84
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
