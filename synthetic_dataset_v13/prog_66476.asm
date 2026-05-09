; DESCRIPTION: Places a orange line segment connecting (223, 235) to (403, 63).
; PLAN: r0=223(x1), r1=235(y1), r2=403(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 235
LDI r2, 403
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
