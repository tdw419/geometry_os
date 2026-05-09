; DESCRIPTION: Places a magenta line segment connecting (190, 215) to (489, 135).
; PLAN: r0=190(x1), r1=215(y1), r2=489(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 215
LDI r2, 489
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
