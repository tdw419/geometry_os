; DESCRIPTION: Places a orange line segment connecting (1, 152) to (6, 71).
; PLAN: r0=1(x1), r1=152(y1), r2=6(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 152
LDI r2, 6
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
