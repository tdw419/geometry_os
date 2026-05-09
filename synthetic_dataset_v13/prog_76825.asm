; DESCRIPTION: Draws a purple line from (474, 23) to (449, 135).
; PLAN: r0=474(x1), r1=23(y1), r2=449(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 23
LDI r2, 449
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
