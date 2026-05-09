; DESCRIPTION: Draws a magenta line from (475, 185) to (47, 20).
; PLAN: r0=475(x1), r1=185(y1), r2=47(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 185
LDI r2, 47
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
