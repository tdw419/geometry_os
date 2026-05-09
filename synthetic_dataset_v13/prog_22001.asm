; DESCRIPTION: Places a orange line segment connecting (175, 116) to (18, 8).
; PLAN: r0=175(x1), r1=116(y1), r2=18(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 116
LDI r2, 18
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
