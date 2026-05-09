; DESCRIPTION: Draws a magenta line from (24, 84) to (377, 167).
; PLAN: r0=24(x1), r1=84(y1), r2=377(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 84
LDI r2, 377
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
