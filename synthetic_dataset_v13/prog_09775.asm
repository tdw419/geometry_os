; DESCRIPTION: Places a cyan line segment connecting (333, 218) to (94, 1).
; PLAN: r0=333(x1), r1=218(y1), r2=94(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 218
LDI r2, 94
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
