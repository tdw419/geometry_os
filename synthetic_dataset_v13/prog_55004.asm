; DESCRIPTION: Places a orange line segment connecting (59, 6) to (439, 37).
; PLAN: r0=59(x1), r1=6(y1), r2=439(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 6
LDI r2, 439
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
