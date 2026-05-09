; DESCRIPTION: Places a cyan line segment connecting (400, 158) to (115, 137).
; PLAN: r0=400(x1), r1=158(y1), r2=115(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 158
LDI r2, 115
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
