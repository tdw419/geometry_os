; DESCRIPTION: Places a orange line segment connecting (22, 236) to (303, 144).
; PLAN: r0=22(x1), r1=236(y1), r2=303(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 236
LDI r2, 303
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
