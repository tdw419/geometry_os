; DESCRIPTION: Places a red line segment connecting (329, 79) to (472, 9).
; PLAN: r0=329(x1), r1=79(y1), r2=472(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 79
LDI r2, 472
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
