; DESCRIPTION: Places a cyan line segment connecting (489, 252) to (410, 240).
; PLAN: r0=489(x1), r1=252(y1), r2=410(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 252
LDI r2, 410
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
