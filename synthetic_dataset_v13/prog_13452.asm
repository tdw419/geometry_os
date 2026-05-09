; DESCRIPTION: Places a orange line segment connecting (380, 19) to (107, 191).
; PLAN: r0=380(x1), r1=19(y1), r2=107(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 19
LDI r2, 107
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
