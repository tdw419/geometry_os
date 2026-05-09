; DESCRIPTION: Places a purple line segment connecting (408, 175) to (510, 138).
; PLAN: r0=408(x1), r1=175(y1), r2=510(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 175
LDI r2, 510
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
