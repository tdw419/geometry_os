; DESCRIPTION: Draws a blue line from (260, 84) to (208, 6).
; PLAN: r0=260(x1), r1=84(y1), r2=208(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 84
LDI r2, 208
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
