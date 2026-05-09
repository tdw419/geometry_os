; DESCRIPTION: Places a green line segment connecting (344, 25) to (395, 2).
; PLAN: r0=344(x1), r1=25(y1), r2=395(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 25
LDI r2, 395
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
