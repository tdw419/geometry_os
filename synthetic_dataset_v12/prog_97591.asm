; DESCRIPTION: Places a yellow line segment connecting (38, 118) to (465, 189).
; PLAN: r0=38(x1), r1=118(y1), r2=465(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 118
LDI r2, 465
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
