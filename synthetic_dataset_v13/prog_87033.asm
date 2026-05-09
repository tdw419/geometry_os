; DESCRIPTION: Places a orange line segment connecting (14, 213) to (510, 137).
; PLAN: r0=14(x1), r1=213(y1), r2=510(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 213
LDI r2, 510
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
