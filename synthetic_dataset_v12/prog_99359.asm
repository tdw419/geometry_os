; DESCRIPTION: Places a purple line segment connecting (193, 153) to (58, 48).
; PLAN: r0=193(x1), r1=153(y1), r2=58(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 153
LDI r2, 58
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
