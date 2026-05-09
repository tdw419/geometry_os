; DESCRIPTION: Draws a magenta line from (321, 226) to (500, 17).
; PLAN: r0=321(x1), r1=226(y1), r2=500(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 226
LDI r2, 500
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
