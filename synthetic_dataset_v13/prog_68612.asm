; DESCRIPTION: Places a orange line segment connecting (342, 164) to (353, 152).
; PLAN: r0=342(x1), r1=164(y1), r2=353(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 164
LDI r2, 353
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
