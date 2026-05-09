; DESCRIPTION: Places a cyan line segment connecting (390, 94) to (454, 179).
; PLAN: r0=390(x1), r1=94(y1), r2=454(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 94
LDI r2, 454
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
