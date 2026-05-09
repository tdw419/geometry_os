; DESCRIPTION: Places a orange line segment connecting (103, 222) to (34, 169).
; PLAN: r0=103(x1), r1=222(y1), r2=34(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 222
LDI r2, 34
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
