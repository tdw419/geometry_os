; DESCRIPTION: Places a orange line segment connecting (430, 246) to (146, 196).
; PLAN: r0=430(x1), r1=246(y1), r2=146(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 246
LDI r2, 146
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
