; DESCRIPTION: Places a magenta line segment connecting (344, 7) to (419, 100).
; PLAN: r0=344(x1), r1=7(y1), r2=419(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 7
LDI r2, 419
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
