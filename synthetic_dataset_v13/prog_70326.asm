; DESCRIPTION: Draws a magenta line from (366, 68) to (373, 3).
; PLAN: r0=366(x1), r1=68(y1), r2=373(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 68
LDI r2, 373
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
