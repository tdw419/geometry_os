; DESCRIPTION: Places a purple line segment connecting (209, 133) to (174, 212).
; PLAN: r0=209(x1), r1=133(y1), r2=174(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 133
LDI r2, 174
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
