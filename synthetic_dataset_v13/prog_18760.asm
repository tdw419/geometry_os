; DESCRIPTION: Places a orange line segment connecting (145, 21) to (480, 33).
; PLAN: r0=145(x1), r1=21(y1), r2=480(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 21
LDI r2, 480
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
