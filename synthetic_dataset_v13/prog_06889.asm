; DESCRIPTION: Places a orange line segment connecting (98, 132) to (433, 172).
; PLAN: r0=98(x1), r1=132(y1), r2=433(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 132
LDI r2, 433
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
