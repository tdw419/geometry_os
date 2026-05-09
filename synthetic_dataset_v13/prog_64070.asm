; DESCRIPTION: Places a orange line segment connecting (469, 150) to (319, 159).
; PLAN: r0=469(x1), r1=150(y1), r2=319(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 150
LDI r2, 319
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
