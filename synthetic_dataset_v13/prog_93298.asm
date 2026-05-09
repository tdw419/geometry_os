; DESCRIPTION: Places a cyan line segment connecting (489, 12) to (88, 80).
; PLAN: r0=489(x1), r1=12(y1), r2=88(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 12
LDI r2, 88
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
