; DESCRIPTION: Places a purple line segment connecting (466, 184) to (368, 236).
; PLAN: r0=466(x1), r1=184(y1), r2=368(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 184
LDI r2, 368
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
