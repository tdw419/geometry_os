; DESCRIPTION: Places a cyan line segment connecting (489, 6) to (489, 122).
; PLAN: r0=489(x1), r1=6(y1), r2=489(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 6
LDI r2, 489
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
