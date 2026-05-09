; DESCRIPTION: Renders a magenta line between points (476, 119) and (108, 70).
; PLAN: r0=476(x1), r1=119(y1), r2=108(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 119
LDI r2, 108
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
