; DESCRIPTION: Places a orange line segment connecting (108, 240) to (367, 220).
; PLAN: r0=108(x1), r1=240(y1), r2=367(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 240
LDI r2, 367
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
