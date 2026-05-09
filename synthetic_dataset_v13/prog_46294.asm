; DESCRIPTION: Renders a magenta line between points (108, 181) and (362, 35).
; PLAN: r0=108(x1), r1=181(y1), r2=362(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 181
LDI r2, 362
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
