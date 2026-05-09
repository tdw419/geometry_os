; DESCRIPTION: Places a purple line segment connecting (258, 90) to (202, 48).
; PLAN: r0=258(x1), r1=90(y1), r2=202(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 90
LDI r2, 202
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
