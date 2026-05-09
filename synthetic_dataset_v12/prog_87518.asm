; DESCRIPTION: Draws a orange line from (152, 82) to (151, 203).
; PLAN: r0=152(x1), r1=82(y1), r2=151(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 82
LDI r2, 151
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
