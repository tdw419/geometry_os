; DESCRIPTION: Places a orange line segment connecting (476, 218) to (303, 27).
; PLAN: r0=476(x1), r1=218(y1), r2=303(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 218
LDI r2, 303
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
