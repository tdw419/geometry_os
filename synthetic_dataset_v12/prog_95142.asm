; DESCRIPTION: Places a orange line segment connecting (497, 206) to (454, 82).
; PLAN: r0=497(x1), r1=206(y1), r2=454(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 206
LDI r2, 454
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
