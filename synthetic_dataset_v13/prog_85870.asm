; DESCRIPTION: Places a orange line segment connecting (284, 9) to (366, 251).
; PLAN: r0=284(x1), r1=9(y1), r2=366(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 9
LDI r2, 366
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
