; DESCRIPTION: Places a orange line segment connecting (71, 112) to (85, 164).
; PLAN: r0=71(x1), r1=112(y1), r2=85(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 112
LDI r2, 85
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
