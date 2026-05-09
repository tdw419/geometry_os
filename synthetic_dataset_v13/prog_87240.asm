; DESCRIPTION: Places a white line segment connecting (344, 241) to (452, 118).
; PLAN: r0=344(x1), r1=241(y1), r2=452(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 241
LDI r2, 452
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
