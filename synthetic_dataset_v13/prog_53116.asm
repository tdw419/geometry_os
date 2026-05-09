; DESCRIPTION: Places a orange line segment connecting (174, 90) to (482, 205).
; PLAN: r0=174(x1), r1=90(y1), r2=482(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 90
LDI r2, 482
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
