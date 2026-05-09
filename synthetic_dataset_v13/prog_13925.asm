; DESCRIPTION: Places a orange line segment connecting (33, 213) to (423, 109).
; PLAN: r0=33(x1), r1=213(y1), r2=423(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 213
LDI r2, 423
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
