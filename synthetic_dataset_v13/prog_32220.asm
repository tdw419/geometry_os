; DESCRIPTION: Places a cyan line segment connecting (370, 106) to (344, 120).
; PLAN: r0=370(x1), r1=106(y1), r2=344(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 106
LDI r2, 344
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
