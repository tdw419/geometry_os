; DESCRIPTION: Places a orange line segment connecting (510, 21) to (303, 185).
; PLAN: r0=510(x1), r1=21(y1), r2=303(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 21
LDI r2, 303
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
