; DESCRIPTION: Draws a magenta line from (129, 35) to (211, 155).
; PLAN: r0=129(x1), r1=35(y1), r2=211(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 35
LDI r2, 211
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
