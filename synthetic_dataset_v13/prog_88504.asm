; DESCRIPTION: Places a cyan line segment connecting (314, 231) to (6, 244).
; PLAN: r0=314(x1), r1=231(y1), r2=6(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 231
LDI r2, 6
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
