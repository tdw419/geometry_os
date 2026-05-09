; DESCRIPTION: Places a orange line segment connecting (115, 248) to (52, 214).
; PLAN: r0=115(x1), r1=248(y1), r2=52(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 248
LDI r2, 52
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
