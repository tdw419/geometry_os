; DESCRIPTION: Draws a orange line from (20, 203) to (474, 92).
; PLAN: r0=20(x1), r1=203(y1), r2=474(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 203
LDI r2, 474
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
