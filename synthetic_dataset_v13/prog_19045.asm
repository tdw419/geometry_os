; DESCRIPTION: Places a orange line segment connecting (315, 60) to (66, 231).
; PLAN: r0=315(x1), r1=60(y1), r2=66(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 60
LDI r2, 66
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
