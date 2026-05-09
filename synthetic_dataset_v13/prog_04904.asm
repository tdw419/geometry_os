; DESCRIPTION: Places a orange line segment connecting (83, 206) to (28, 126).
; PLAN: r0=83(x1), r1=206(y1), r2=28(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 206
LDI r2, 28
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
