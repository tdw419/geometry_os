; DESCRIPTION: Places a orange line segment connecting (393, 15) to (72, 173).
; PLAN: r0=393(x1), r1=15(y1), r2=72(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 15
LDI r2, 72
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
