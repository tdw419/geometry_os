; DESCRIPTION: Draws a blue line from (344, 114) to (212, 47).
; PLAN: r0=344(x1), r1=114(y1), r2=212(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 114
LDI r2, 212
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
