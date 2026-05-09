; DESCRIPTION: Draws a magenta line from (55, 70) to (344, 88).
; PLAN: r0=55(x1), r1=70(y1), r2=344(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 70
LDI r2, 344
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
