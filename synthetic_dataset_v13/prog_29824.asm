; DESCRIPTION: Places a cyan line segment connecting (344, 157) to (30, 144).
; PLAN: r0=344(x1), r1=157(y1), r2=30(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 157
LDI r2, 30
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
