; DESCRIPTION: Places a orange line segment connecting (237, 112) to (68, 220).
; PLAN: r0=237(x1), r1=112(y1), r2=68(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 112
LDI r2, 68
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
