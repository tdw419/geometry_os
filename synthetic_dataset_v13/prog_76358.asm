; DESCRIPTION: Places a purple line segment connecting (193, 59) to (236, 14).
; PLAN: r0=193(x1), r1=59(y1), r2=236(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 59
LDI r2, 236
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
