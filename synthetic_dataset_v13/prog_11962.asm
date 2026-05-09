; DESCRIPTION: Places a purple line segment connecting (13, 209) to (337, 95).
; PLAN: r0=13(x1), r1=209(y1), r2=337(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 209
LDI r2, 337
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
