; DESCRIPTION: Places a yellow line segment connecting (213, 158) to (247, 79).
; PLAN: r0=213(x1), r1=158(y1), r2=247(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 158
LDI r2, 247
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
