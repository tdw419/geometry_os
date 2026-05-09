; DESCRIPTION: Places a orange line segment connecting (281, 5) to (51, 67).
; PLAN: r0=281(x1), r1=5(y1), r2=51(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 5
LDI r2, 51
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
