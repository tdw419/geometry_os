; DESCRIPTION: Places a cyan line segment connecting (489, 248) to (7, 157).
; PLAN: r0=489(x1), r1=248(y1), r2=7(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 248
LDI r2, 7
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
