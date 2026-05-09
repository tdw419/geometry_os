; DESCRIPTION: Places a orange line segment connecting (109, 136) to (95, 164).
; PLAN: r0=109(x1), r1=136(y1), r2=95(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 136
LDI r2, 95
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
