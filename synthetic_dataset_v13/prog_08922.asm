; DESCRIPTION: Places a orange line segment connecting (127, 210) to (203, 56).
; PLAN: r0=127(x1), r1=210(y1), r2=203(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 210
LDI r2, 203
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
