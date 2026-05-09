; DESCRIPTION: Draws a magenta line from (221, 211) to (288, 136).
; PLAN: r0=221(x1), r1=211(y1), r2=288(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 211
LDI r2, 288
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
