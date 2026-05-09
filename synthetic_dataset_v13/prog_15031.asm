; DESCRIPTION: Draws a magenta line from (162, 84) to (144, 77).
; PLAN: r0=162(x1), r1=84(y1), r2=144(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 84
LDI r2, 144
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
