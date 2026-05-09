; DESCRIPTION: Places a blue line segment connecting (181, 58) to (186, 207).
; PLAN: r0=181(x1), r1=58(y1), r2=186(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 58
LDI r2, 186
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
