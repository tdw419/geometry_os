; DESCRIPTION: Places a magenta line segment connecting (306, 149) to (315, 218).
; PLAN: r0=306(x1), r1=149(y1), r2=315(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 149
LDI r2, 315
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
