; DESCRIPTION: Places a orange line segment connecting (445, 68) to (358, 160).
; PLAN: r0=445(x1), r1=68(y1), r2=358(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 68
LDI r2, 358
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
