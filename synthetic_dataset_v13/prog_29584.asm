; DESCRIPTION: Draws a magenta line from (49, 70) to (344, 248).
; PLAN: r0=49(x1), r1=70(y1), r2=344(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 70
LDI r2, 344
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
