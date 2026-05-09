; DESCRIPTION: Places a yellow line segment connecting (403, 217) to (106, 67).
; PLAN: r0=403(x1), r1=217(y1), r2=106(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 217
LDI r2, 106
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
