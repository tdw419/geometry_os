; DESCRIPTION: Places a orange line segment connecting (480, 44) to (485, 152).
; PLAN: r0=480(x1), r1=44(y1), r2=485(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 44
LDI r2, 485
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
