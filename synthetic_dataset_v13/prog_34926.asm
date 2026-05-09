; DESCRIPTION: Places a purple line segment connecting (225, 174) to (127, 181).
; PLAN: r0=225(x1), r1=174(y1), r2=127(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 174
LDI r2, 127
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
