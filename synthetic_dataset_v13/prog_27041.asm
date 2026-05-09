; DESCRIPTION: Draws a magenta line from (133, 175) to (266, 68).
; PLAN: r0=133(x1), r1=175(y1), r2=266(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 175
LDI r2, 266
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
