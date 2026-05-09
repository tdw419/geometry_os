; DESCRIPTION: Places a orange line segment connecting (489, 32) to (482, 4).
; PLAN: r0=489(x1), r1=32(y1), r2=482(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 32
LDI r2, 482
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
