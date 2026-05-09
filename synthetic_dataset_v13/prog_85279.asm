; DESCRIPTION: Places a blue line segment connecting (478, 107) to (188, 198).
; PLAN: r0=478(x1), r1=107(y1), r2=188(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 107
LDI r2, 188
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
