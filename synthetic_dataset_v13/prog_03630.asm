; DESCRIPTION: Places a magenta line segment connecting (457, 184) to (344, 7).
; PLAN: r0=457(x1), r1=184(y1), r2=344(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 184
LDI r2, 344
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
