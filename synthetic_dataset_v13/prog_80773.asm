; DESCRIPTION: Places a green line segment connecting (153, 115) to (344, 208).
; PLAN: r0=153(x1), r1=115(y1), r2=344(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 115
LDI r2, 344
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
