; DESCRIPTION: Places a orange line segment connecting (217, 31) to (115, 197).
; PLAN: r0=217(x1), r1=31(y1), r2=115(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 31
LDI r2, 115
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
