; DESCRIPTION: Places a yellow line segment connecting (336, 237) to (106, 155).
; PLAN: r0=336(x1), r1=237(y1), r2=106(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 237
LDI r2, 106
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
