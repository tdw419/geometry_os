; DESCRIPTION: Places a orange line segment connecting (113, 154) to (203, 23).
; PLAN: r0=113(x1), r1=154(y1), r2=203(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 154
LDI r2, 203
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
