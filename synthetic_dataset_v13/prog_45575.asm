; DESCRIPTION: Places a purple line segment connecting (398, 137) to (368, 196).
; PLAN: r0=398(x1), r1=137(y1), r2=368(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 137
LDI r2, 368
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
