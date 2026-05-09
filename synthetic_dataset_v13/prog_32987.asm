; DESCRIPTION: Places a orange line segment connecting (392, 83) to (279, 22).
; PLAN: r0=392(x1), r1=83(y1), r2=279(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 83
LDI r2, 279
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
