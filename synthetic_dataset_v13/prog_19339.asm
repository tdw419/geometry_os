; DESCRIPTION: Places a orange line segment connecting (430, 108) to (108, 177).
; PLAN: r0=430(x1), r1=108(y1), r2=108(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 108
LDI r2, 108
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
