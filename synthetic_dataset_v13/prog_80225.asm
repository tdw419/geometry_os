; DESCRIPTION: Places a orange line segment connecting (90, 78) to (92, 108).
; PLAN: r0=90(x1), r1=78(y1), r2=92(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 78
LDI r2, 92
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
