; DESCRIPTION: Places a orange line segment connecting (493, 71) to (310, 24).
; PLAN: r0=493(x1), r1=71(y1), r2=310(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 71
LDI r2, 310
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
