; DESCRIPTION: Draws a magenta line from (152, 175) to (54, 135).
; PLAN: r0=152(x1), r1=175(y1), r2=54(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 175
LDI r2, 54
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
