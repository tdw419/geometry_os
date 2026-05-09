; DESCRIPTION: Places a orange line segment connecting (422, 249) to (235, 232).
; PLAN: r0=422(x1), r1=249(y1), r2=235(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 249
LDI r2, 235
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
