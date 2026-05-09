; DESCRIPTION: Places a purple line segment connecting (152, 48) to (332, 123).
; PLAN: r0=152(x1), r1=48(y1), r2=332(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 48
LDI r2, 332
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
