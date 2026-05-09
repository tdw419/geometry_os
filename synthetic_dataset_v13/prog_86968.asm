; DESCRIPTION: Places a green line segment connecting (344, 5) to (172, 71).
; PLAN: r0=344(x1), r1=5(y1), r2=172(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 5
LDI r2, 172
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
