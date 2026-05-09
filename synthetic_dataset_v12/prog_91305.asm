; DESCRIPTION: Places a orange line segment connecting (173, 41) to (489, 177).
; PLAN: r0=173(x1), r1=41(y1), r2=489(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 41
LDI r2, 489
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
