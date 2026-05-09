; DESCRIPTION: Places a orange line segment connecting (353, 8) to (435, 108).
; PLAN: r0=353(x1), r1=8(y1), r2=435(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 8
LDI r2, 435
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
