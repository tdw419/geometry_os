; DESCRIPTION: Draws a magenta line from (505, 11) to (273, 180).
; PLAN: r0=505(x1), r1=11(y1), r2=273(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 11
LDI r2, 273
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
