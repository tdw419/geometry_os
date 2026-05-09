; DESCRIPTION: Places a cyan line segment connecting (91, 186) to (432, 118).
; PLAN: r0=91(x1), r1=186(y1), r2=432(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 186
LDI r2, 432
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
