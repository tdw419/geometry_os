; DESCRIPTION: Places a cyan line segment connecting (318, 230) to (489, 61).
; PLAN: r0=318(x1), r1=230(y1), r2=489(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 230
LDI r2, 489
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
