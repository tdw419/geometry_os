; DESCRIPTION: Places a orange line segment connecting (211, 250) to (127, 234).
; PLAN: r0=211(x1), r1=250(y1), r2=127(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 250
LDI r2, 127
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
