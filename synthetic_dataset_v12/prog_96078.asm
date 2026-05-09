; DESCRIPTION: Draws a purple line from (20, 200) to (311, 113).
; PLAN: r0=20(x1), r1=200(y1), r2=311(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 200
LDI r2, 311
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
