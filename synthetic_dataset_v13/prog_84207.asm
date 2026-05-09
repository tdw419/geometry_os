; DESCRIPTION: Places a orange line segment connecting (6, 34) to (284, 40).
; PLAN: r0=6(x1), r1=34(y1), r2=284(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 34
LDI r2, 284
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
