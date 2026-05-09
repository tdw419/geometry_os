; DESCRIPTION: Places a magenta line segment connecting (353, 121) to (211, 127).
; PLAN: r0=353(x1), r1=121(y1), r2=211(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 121
LDI r2, 211
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
