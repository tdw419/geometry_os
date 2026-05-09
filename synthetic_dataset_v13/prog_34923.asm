; DESCRIPTION: Places a magenta line segment connecting (34, 208) to (198, 31).
; PLAN: r0=34(x1), r1=208(y1), r2=198(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 208
LDI r2, 198
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
