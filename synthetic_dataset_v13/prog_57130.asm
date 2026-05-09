; DESCRIPTION: Places a cyan line segment connecting (94, 70) to (356, 11).
; PLAN: r0=94(x1), r1=70(y1), r2=356(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 70
LDI r2, 356
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
