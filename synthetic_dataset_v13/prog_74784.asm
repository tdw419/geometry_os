; DESCRIPTION: Places a magenta line segment connecting (335, 217) to (249, 43).
; PLAN: r0=335(x1), r1=217(y1), r2=249(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 217
LDI r2, 249
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
