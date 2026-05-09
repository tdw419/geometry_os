; DESCRIPTION: Places a magenta line segment connecting (67, 212) to (64, 247).
; PLAN: r0=67(x1), r1=212(y1), r2=64(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 212
LDI r2, 64
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
