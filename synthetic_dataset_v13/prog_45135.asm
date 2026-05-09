; DESCRIPTION: Places a orange line segment connecting (262, 116) to (132, 54).
; PLAN: r0=262(x1), r1=116(y1), r2=132(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 116
LDI r2, 132
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
