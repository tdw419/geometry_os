; DESCRIPTION: Places a purple line segment connecting (392, 116) to (445, 22).
; PLAN: r0=392(x1), r1=116(y1), r2=445(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 116
LDI r2, 445
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
