; DESCRIPTION: Places a purple line segment connecting (440, 27) to (278, 36).
; PLAN: r0=440(x1), r1=27(y1), r2=278(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 27
LDI r2, 278
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
