; DESCRIPTION: Places a orange line segment connecting (237, 233) to (486, 4).
; PLAN: r0=237(x1), r1=233(y1), r2=486(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 233
LDI r2, 486
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
