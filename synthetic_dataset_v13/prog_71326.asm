; DESCRIPTION: Places a cyan line segment connecting (432, 148) to (248, 149).
; PLAN: r0=432(x1), r1=148(y1), r2=248(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 148
LDI r2, 248
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
