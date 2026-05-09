; DESCRIPTION: Places a orange line segment connecting (195, 15) to (433, 71).
; PLAN: r0=195(x1), r1=15(y1), r2=433(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 15
LDI r2, 433
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
