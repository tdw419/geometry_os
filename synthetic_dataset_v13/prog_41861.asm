; DESCRIPTION: Places a magenta line segment connecting (484, 149) to (319, 49).
; PLAN: r0=484(x1), r1=149(y1), r2=319(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 149
LDI r2, 319
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
