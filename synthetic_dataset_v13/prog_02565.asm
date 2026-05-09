; DESCRIPTION: Places a yellow line segment connecting (344, 246) to (171, 229).
; PLAN: r0=344(x1), r1=246(y1), r2=171(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 246
LDI r2, 171
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
