; DESCRIPTION: Places a orange line segment connecting (391, 178) to (176, 234).
; PLAN: r0=391(x1), r1=178(y1), r2=176(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 178
LDI r2, 176
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
