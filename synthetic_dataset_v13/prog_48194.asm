; DESCRIPTION: Places a orange line segment connecting (150, 192) to (87, 220).
; PLAN: r0=150(x1), r1=192(y1), r2=87(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 192
LDI r2, 87
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
