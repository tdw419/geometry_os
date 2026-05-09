; DESCRIPTION: Places a purple line segment connecting (460, 55) to (152, 2).
; PLAN: r0=460(x1), r1=55(y1), r2=152(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 55
LDI r2, 152
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
