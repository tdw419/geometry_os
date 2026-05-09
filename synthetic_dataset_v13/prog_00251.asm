; DESCRIPTION: Places a yellow line segment connecting (40, 162) to (114, 127).
; PLAN: r0=40(x1), r1=162(y1), r2=114(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 162
LDI r2, 114
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
