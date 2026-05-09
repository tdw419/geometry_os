; DESCRIPTION: Places a purple line segment connecting (153, 150) to (27, 35).
; PLAN: r0=153(x1), r1=150(y1), r2=27(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 150
LDI r2, 27
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
