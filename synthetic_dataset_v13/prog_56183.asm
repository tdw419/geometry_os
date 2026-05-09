; DESCRIPTION: Draws a magenta line from (135, 137) to (466, 100).
; PLAN: r0=135(x1), r1=137(y1), r2=466(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 137
LDI r2, 466
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
