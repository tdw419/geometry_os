; DESCRIPTION: Places a orange line segment connecting (475, 21) to (113, 249).
; PLAN: r0=475(x1), r1=21(y1), r2=113(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 21
LDI r2, 113
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
