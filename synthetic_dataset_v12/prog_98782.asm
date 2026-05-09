; DESCRIPTION: Places a orange line segment connecting (270, 178) to (338, 152).
; PLAN: r0=270(x1), r1=178(y1), r2=338(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 178
LDI r2, 338
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
