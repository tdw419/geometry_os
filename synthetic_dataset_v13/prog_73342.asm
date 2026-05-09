; DESCRIPTION: Draws a magenta line from (322, 155) to (500, 243).
; PLAN: r0=322(x1), r1=155(y1), r2=500(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 155
LDI r2, 500
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
