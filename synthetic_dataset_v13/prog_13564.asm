; DESCRIPTION: Renders a magenta line between points (377, 162) and (366, 206).
; PLAN: r0=377(x1), r1=162(y1), r2=366(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 162
LDI r2, 366
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
