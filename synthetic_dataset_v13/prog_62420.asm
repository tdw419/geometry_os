; DESCRIPTION: Places a purple line segment connecting (286, 104) to (482, 65).
; PLAN: r0=286(x1), r1=104(y1), r2=482(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 104
LDI r2, 482
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
