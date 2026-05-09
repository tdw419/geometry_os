; DESCRIPTION: Places a orange line segment connecting (176, 71) to (288, 116).
; PLAN: r0=176(x1), r1=71(y1), r2=288(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 71
LDI r2, 288
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
