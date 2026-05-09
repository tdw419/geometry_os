; DESCRIPTION: Places a blue line segment connecting (127, 185) to (115, 114).
; PLAN: r0=127(x1), r1=185(y1), r2=115(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 185
LDI r2, 115
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
