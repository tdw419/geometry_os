; DESCRIPTION: Places a orange line segment connecting (22, 207) to (352, 7).
; PLAN: r0=22(x1), r1=207(y1), r2=352(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 207
LDI r2, 352
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
