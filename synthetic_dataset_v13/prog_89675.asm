; DESCRIPTION: Places a purple line segment connecting (164, 137) to (507, 221).
; PLAN: r0=164(x1), r1=137(y1), r2=507(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 137
LDI r2, 507
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
