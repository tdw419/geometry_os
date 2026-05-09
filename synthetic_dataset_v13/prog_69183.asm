; DESCRIPTION: Places a orange line segment connecting (469, 31) to (285, 236).
; PLAN: r0=469(x1), r1=31(y1), r2=285(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 31
LDI r2, 285
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
