; DESCRIPTION: Draws a magenta line from (196, 70) to (49, 149).
; PLAN: r0=196(x1), r1=70(y1), r2=49(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 70
LDI r2, 49
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
