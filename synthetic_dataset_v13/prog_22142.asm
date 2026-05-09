; DESCRIPTION: Places a blue line segment connecting (303, 169) to (208, 37).
; PLAN: r0=303(x1), r1=169(y1), r2=208(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 169
LDI r2, 208
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
