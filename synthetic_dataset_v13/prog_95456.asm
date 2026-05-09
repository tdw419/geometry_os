; DESCRIPTION: Places a orange line segment connecting (240, 90) to (353, 71).
; PLAN: r0=240(x1), r1=90(y1), r2=353(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 90
LDI r2, 353
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
