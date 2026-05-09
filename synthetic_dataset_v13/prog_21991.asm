; DESCRIPTION: Places a orange line segment connecting (482, 95) to (436, 200).
; PLAN: r0=482(x1), r1=95(y1), r2=436(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 95
LDI r2, 436
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
