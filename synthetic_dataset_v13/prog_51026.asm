; DESCRIPTION: Places a orange line segment connecting (445, 43) to (468, 167).
; PLAN: r0=445(x1), r1=43(y1), r2=468(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 43
LDI r2, 468
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
