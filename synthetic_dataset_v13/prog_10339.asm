; DESCRIPTION: Places a magenta line segment connecting (335, 49) to (75, 236).
; PLAN: r0=335(x1), r1=49(y1), r2=75(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 49
LDI r2, 75
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
