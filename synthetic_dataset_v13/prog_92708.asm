; DESCRIPTION: Places a magenta line segment connecting (344, 161) to (212, 29).
; PLAN: r0=344(x1), r1=161(y1), r2=212(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 161
LDI r2, 212
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
