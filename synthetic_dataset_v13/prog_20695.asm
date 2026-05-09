; DESCRIPTION: Places a magenta line segment connecting (54, 34) to (126, 67).
; PLAN: r0=54(x1), r1=34(y1), r2=126(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 34
LDI r2, 126
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
