; DESCRIPTION: Places a orange line segment connecting (407, 216) to (479, 7).
; PLAN: r0=407(x1), r1=216(y1), r2=479(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 216
LDI r2, 479
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
