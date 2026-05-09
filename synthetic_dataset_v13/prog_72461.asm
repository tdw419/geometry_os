; DESCRIPTION: Places a purple line segment connecting (269, 166) to (332, 220).
; PLAN: r0=269(x1), r1=166(y1), r2=332(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 166
LDI r2, 332
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
