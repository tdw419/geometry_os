; DESCRIPTION: Places a orange line segment connecting (393, 200) to (338, 92).
; PLAN: r0=393(x1), r1=200(y1), r2=338(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 200
LDI r2, 338
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
