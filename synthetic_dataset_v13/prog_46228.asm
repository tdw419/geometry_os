; DESCRIPTION: Places a purple line segment connecting (465, 247) to (2, 94).
; PLAN: r0=465(x1), r1=247(y1), r2=2(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 247
LDI r2, 2
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
