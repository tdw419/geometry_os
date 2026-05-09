; DESCRIPTION: Places a orange line segment connecting (470, 136) to (145, 222).
; PLAN: r0=470(x1), r1=136(y1), r2=145(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 136
LDI r2, 145
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
