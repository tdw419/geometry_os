; DESCRIPTION: Places a red line segment connecting (406, 231) to (266, 35).
; PLAN: r0=406(x1), r1=231(y1), r2=266(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 231
LDI r2, 266
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
