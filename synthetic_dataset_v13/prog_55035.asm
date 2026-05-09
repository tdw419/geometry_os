; DESCRIPTION: Places a purple line segment connecting (233, 152) to (413, 15).
; PLAN: r0=233(x1), r1=152(y1), r2=413(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 152
LDI r2, 413
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
