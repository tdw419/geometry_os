; DESCRIPTION: Places a purple line segment connecting (209, 126) to (463, 202).
; PLAN: r0=209(x1), r1=126(y1), r2=463(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 126
LDI r2, 463
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
