; DESCRIPTION: Draws a magenta line from (121, 26) to (200, 70).
; PLAN: r0=121(x1), r1=26(y1), r2=200(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 26
LDI r2, 200
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
