; DESCRIPTION: Places a cyan line segment connecting (276, 231) to (162, 159).
; PLAN: r0=276(x1), r1=231(y1), r2=162(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 231
LDI r2, 162
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
