; DESCRIPTION: Places a purple line segment connecting (152, 176) to (336, 141).
; PLAN: r0=152(x1), r1=176(y1), r2=336(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 176
LDI r2, 336
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
