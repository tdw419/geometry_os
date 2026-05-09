; DESCRIPTION: Places a magenta line segment connecting (485, 227) to (246, 205).
; PLAN: r0=485(x1), r1=227(y1), r2=246(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 227
LDI r2, 246
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
