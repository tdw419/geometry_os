; DESCRIPTION: Places a orange line segment connecting (264, 132) to (90, 133).
; PLAN: r0=264(x1), r1=132(y1), r2=90(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 132
LDI r2, 90
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
