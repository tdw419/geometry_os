; DESCRIPTION: Places a orange line segment connecting (17, 58) to (176, 235).
; PLAN: r0=17(x1), r1=58(y1), r2=176(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 58
LDI r2, 176
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
