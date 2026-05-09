; DESCRIPTION: Places a orange line segment connecting (445, 223) to (428, 109).
; PLAN: r0=445(x1), r1=223(y1), r2=428(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 223
LDI r2, 428
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
