; DESCRIPTION: Renders a magenta line between points (169, 38) and (362, 135).
; PLAN: r0=169(x1), r1=38(y1), r2=362(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 38
LDI r2, 362
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
