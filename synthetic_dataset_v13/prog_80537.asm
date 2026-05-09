; DESCRIPTION: Places a purple line segment connecting (143, 220) to (462, 222).
; PLAN: r0=143(x1), r1=220(y1), r2=462(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 220
LDI r2, 462
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
