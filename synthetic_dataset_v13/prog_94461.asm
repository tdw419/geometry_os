; DESCRIPTION: Places a cyan line segment connecting (332, 162) to (344, 134).
; PLAN: r0=332(x1), r1=162(y1), r2=344(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 162
LDI r2, 344
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
