; DESCRIPTION: Places a purple line segment connecting (371, 152) to (391, 140).
; PLAN: r0=371(x1), r1=152(y1), r2=391(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 152
LDI r2, 391
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
