; DESCRIPTION: Places a orange line segment connecting (445, 86) to (4, 5).
; PLAN: r0=445(x1), r1=86(y1), r2=4(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 86
LDI r2, 4
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
