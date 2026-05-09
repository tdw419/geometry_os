; DESCRIPTION: Draws a magenta line from (22, 22) to (153, 205).
; PLAN: r0=22(x1), r1=22(y1), r2=153(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 22
LDI r2, 153
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
