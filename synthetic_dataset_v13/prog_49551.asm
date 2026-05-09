; DESCRIPTION: Places a orange line segment connecting (32, 36) to (438, 50).
; PLAN: r0=32(x1), r1=36(y1), r2=438(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 36
LDI r2, 438
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
