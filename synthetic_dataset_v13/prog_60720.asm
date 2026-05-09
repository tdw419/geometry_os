; DESCRIPTION: Places a cyan line segment connecting (437, 56) to (139, 94).
; PLAN: r0=437(x1), r1=56(y1), r2=139(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 56
LDI r2, 139
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
