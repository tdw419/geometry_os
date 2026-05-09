; DESCRIPTION: Places a orange line segment connecting (428, 91) to (386, 235).
; PLAN: r0=428(x1), r1=91(y1), r2=386(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 91
LDI r2, 386
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
