; DESCRIPTION: Places a purple line segment connecting (241, 107) to (195, 236).
; PLAN: r0=241(x1), r1=107(y1), r2=195(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 107
LDI r2, 195
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
