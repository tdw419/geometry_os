; DESCRIPTION: Places a purple line segment connecting (355, 40) to (263, 126).
; PLAN: r0=355(x1), r1=40(y1), r2=263(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 40
LDI r2, 263
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
