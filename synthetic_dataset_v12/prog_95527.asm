; DESCRIPTION: Places a orange line segment connecting (405, 84) to (140, 235).
; PLAN: r0=405(x1), r1=84(y1), r2=140(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 84
LDI r2, 140
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
