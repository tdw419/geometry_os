; DESCRIPTION: Places a orange line segment connecting (445, 188) to (385, 7).
; PLAN: r0=445(x1), r1=188(y1), r2=385(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 188
LDI r2, 385
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
