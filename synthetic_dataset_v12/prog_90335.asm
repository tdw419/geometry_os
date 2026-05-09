; DESCRIPTION: Places a orange line segment connecting (465, 173) to (318, 56).
; PLAN: r0=465(x1), r1=173(y1), r2=318(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 173
LDI r2, 318
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
