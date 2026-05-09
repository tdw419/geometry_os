; DESCRIPTION: Places a purple line segment connecting (241, 195) to (21, 137).
; PLAN: r0=241(x1), r1=195(y1), r2=21(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 195
LDI r2, 21
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
