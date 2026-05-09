; DESCRIPTION: Places a blue line segment connecting (186, 86) to (140, 90).
; PLAN: r0=186(x1), r1=86(y1), r2=140(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 86
LDI r2, 140
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
