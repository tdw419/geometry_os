; DESCRIPTION: Places a blue line segment connecting (230, 10) to (249, 79).
; PLAN: r0=230(x1), r1=10(y1), r2=249(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 10
LDI r2, 249
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
