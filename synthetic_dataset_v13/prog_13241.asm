; DESCRIPTION: Places a magenta line segment connecting (240, 202) to (335, 132).
; PLAN: r0=240(x1), r1=202(y1), r2=335(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 202
LDI r2, 335
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
