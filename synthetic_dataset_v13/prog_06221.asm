; DESCRIPTION: Places a orange line segment connecting (403, 235) to (70, 165).
; PLAN: r0=403(x1), r1=235(y1), r2=70(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 235
LDI r2, 70
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
