; DESCRIPTION: Places a orange line segment connecting (303, 115) to (33, 169).
; PLAN: r0=303(x1), r1=115(y1), r2=33(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 115
LDI r2, 33
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
