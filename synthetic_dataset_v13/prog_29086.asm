; DESCRIPTION: Places a magenta line segment connecting (335, 31) to (213, 212).
; PLAN: r0=335(x1), r1=31(y1), r2=213(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 31
LDI r2, 213
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
