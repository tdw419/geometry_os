; DESCRIPTION: Places a orange line segment connecting (166, 9) to (290, 198).
; PLAN: r0=166(x1), r1=9(y1), r2=290(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 9
LDI r2, 290
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
