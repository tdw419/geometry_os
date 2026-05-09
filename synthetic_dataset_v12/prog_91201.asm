; DESCRIPTION: Places a purple line segment connecting (311, 231) to (35, 153).
; PLAN: r0=311(x1), r1=231(y1), r2=35(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 231
LDI r2, 35
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
