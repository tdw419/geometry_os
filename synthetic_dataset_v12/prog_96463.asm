; DESCRIPTION: Places a magenta line segment connecting (465, 127) to (129, 34).
; PLAN: r0=465(x1), r1=127(y1), r2=129(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 127
LDI r2, 129
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
