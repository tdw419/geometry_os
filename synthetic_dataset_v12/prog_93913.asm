; DESCRIPTION: Places a orange line segment connecting (423, 119) to (285, 213).
; PLAN: r0=423(x1), r1=119(y1), r2=285(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 119
LDI r2, 285
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
