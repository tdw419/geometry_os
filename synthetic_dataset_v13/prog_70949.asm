; DESCRIPTION: Places a orange line segment connecting (217, 89) to (281, 134).
; PLAN: r0=217(x1), r1=89(y1), r2=281(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 89
LDI r2, 281
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
