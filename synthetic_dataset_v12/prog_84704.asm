; DESCRIPTION: Places a purple line segment connecting (494, 193) to (428, 192).
; PLAN: r0=494(x1), r1=193(y1), r2=428(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 193
LDI r2, 428
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
