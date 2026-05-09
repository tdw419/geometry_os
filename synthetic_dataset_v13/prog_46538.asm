; DESCRIPTION: Places a magenta line segment connecting (233, 233) to (67, 207).
; PLAN: r0=233(x1), r1=233(y1), r2=67(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 233
LDI r2, 67
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
