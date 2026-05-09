; DESCRIPTION: Places a purple line segment connecting (145, 1) to (243, 208).
; PLAN: r0=145(x1), r1=1(y1), r2=243(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 1
LDI r2, 243
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
