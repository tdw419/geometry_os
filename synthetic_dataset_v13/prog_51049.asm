; DESCRIPTION: Places a green line segment connecting (16, 231) to (77, 23).
; PLAN: r0=16(x1), r1=231(y1), r2=77(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 231
LDI r2, 77
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
