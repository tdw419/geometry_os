; DESCRIPTION: Places a black line segment connecting (14, 186) to (241, 205).
; PLAN: r0=14(x1), r1=186(y1), r2=241(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 186
LDI r2, 241
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
