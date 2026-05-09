; DESCRIPTION: Draws a magenta line from (84, 118) to (360, 20).
; PLAN: r0=84(x1), r1=118(y1), r2=360(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 118
LDI r2, 360
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
