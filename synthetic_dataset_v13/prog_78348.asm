; DESCRIPTION: Places a blue line segment connecting (272, 74) to (123, 169).
; PLAN: r0=272(x1), r1=74(y1), r2=123(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 74
LDI r2, 123
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
