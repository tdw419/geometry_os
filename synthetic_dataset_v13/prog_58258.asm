; DESCRIPTION: Places a green line segment connecting (344, 122) to (174, 20).
; PLAN: r0=344(x1), r1=122(y1), r2=174(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 122
LDI r2, 174
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
