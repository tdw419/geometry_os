; DESCRIPTION: Draws a orange line from (83, 162) to (495, 206).
; PLAN: r0=83(x1), r1=162(y1), r2=495(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 162
LDI r2, 495
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
