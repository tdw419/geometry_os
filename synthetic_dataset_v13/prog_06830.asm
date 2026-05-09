; DESCRIPTION: Places a orange line segment connecting (240, 13) to (416, 193).
; PLAN: r0=240(x1), r1=13(y1), r2=416(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 13
LDI r2, 416
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
