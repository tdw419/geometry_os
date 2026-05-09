; DESCRIPTION: Places a orange line segment connecting (470, 178) to (102, 208).
; PLAN: r0=470(x1), r1=178(y1), r2=102(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 178
LDI r2, 102
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
