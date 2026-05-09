; DESCRIPTION: Places a green line segment connecting (432, 241) to (374, 195).
; PLAN: r0=432(x1), r1=241(y1), r2=374(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 241
LDI r2, 374
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
