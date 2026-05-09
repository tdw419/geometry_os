; DESCRIPTION: Places a orange line segment connecting (36, 17) to (225, 172).
; PLAN: r0=36(x1), r1=17(y1), r2=225(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 17
LDI r2, 225
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
