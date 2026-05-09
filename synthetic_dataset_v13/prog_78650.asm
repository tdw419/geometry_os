; DESCRIPTION: Places a purple line segment connecting (55, 234) to (44, 222).
; PLAN: r0=55(x1), r1=234(y1), r2=44(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 234
LDI r2, 44
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
