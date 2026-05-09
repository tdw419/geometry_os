; DESCRIPTION: Draws a blue line from (450, 106) to (149, 191).
; PLAN: r0=450(x1), r1=106(y1), r2=149(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 106
LDI r2, 149
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
