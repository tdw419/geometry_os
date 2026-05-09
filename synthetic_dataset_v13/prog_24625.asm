; DESCRIPTION: Draws a magenta line from (136, 161) to (185, 59).
; PLAN: r0=136(x1), r1=161(y1), r2=185(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 161
LDI r2, 185
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
