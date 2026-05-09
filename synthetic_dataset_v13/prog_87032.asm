; DESCRIPTION: Places a orange line segment connecting (286, 249) to (122, 140).
; PLAN: r0=286(x1), r1=249(y1), r2=122(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 249
LDI r2, 122
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
