; DESCRIPTION: Draws a magenta line from (400, 217) to (129, 62).
; PLAN: r0=400(x1), r1=217(y1), r2=129(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 217
LDI r2, 129
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
