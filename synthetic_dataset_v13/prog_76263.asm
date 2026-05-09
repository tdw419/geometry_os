; DESCRIPTION: Places a orange line segment connecting (398, 75) to (196, 139).
; PLAN: r0=398(x1), r1=75(y1), r2=196(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 75
LDI r2, 196
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
