; DESCRIPTION: Places a magenta line segment connecting (413, 203) to (181, 212).
; PLAN: r0=413(x1), r1=203(y1), r2=181(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 203
LDI r2, 181
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
