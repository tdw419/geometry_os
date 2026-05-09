; DESCRIPTION: Places a cyan line segment connecting (490, 184) to (390, 231).
; PLAN: r0=490(x1), r1=184(y1), r2=390(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 184
LDI r2, 390
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
