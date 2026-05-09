; DESCRIPTION: Draws a magenta line from (112, 169) to (128, 180).
; PLAN: r0=112(x1), r1=169(y1), r2=128(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 169
LDI r2, 128
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
