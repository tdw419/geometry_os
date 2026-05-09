; DESCRIPTION: Places a purple line segment connecting (77, 116) to (482, 63).
; PLAN: r0=77(x1), r1=116(y1), r2=482(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 116
LDI r2, 482
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
