; DESCRIPTION: Draws a magenta line from (300, 85) to (344, 165).
; PLAN: r0=300(x1), r1=85(y1), r2=344(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 85
LDI r2, 344
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
