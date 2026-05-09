; DESCRIPTION: Places a purple line segment connecting (403, 176) to (152, 205).
; PLAN: r0=403(x1), r1=176(y1), r2=152(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 176
LDI r2, 152
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
