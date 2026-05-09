; DESCRIPTION: Places a black line segment connecting (266, 59) to (489, 30).
; PLAN: r0=266(x1), r1=59(y1), r2=489(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 59
LDI r2, 489
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
