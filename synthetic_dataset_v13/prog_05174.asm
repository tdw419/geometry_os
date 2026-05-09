; DESCRIPTION: Renders a magenta line between points (411, 212) and (402, 135).
; PLAN: r0=411(x1), r1=212(y1), r2=402(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 212
LDI r2, 402
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
