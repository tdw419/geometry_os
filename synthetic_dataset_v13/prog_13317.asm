; DESCRIPTION: Places a magenta line segment connecting (500, 204) to (80, 67).
; PLAN: r0=500(x1), r1=204(y1), r2=80(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 204
LDI r2, 80
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
