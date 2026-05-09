; DESCRIPTION: Places a orange line segment connecting (217, 66) to (410, 140).
; PLAN: r0=217(x1), r1=66(y1), r2=410(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 66
LDI r2, 410
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
