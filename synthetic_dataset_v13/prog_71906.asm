; DESCRIPTION: Renders a blue line between points (162, 108) and (246, 206).
; PLAN: r0=162(x1), r1=108(y1), r2=246(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 108
LDI r2, 246
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
