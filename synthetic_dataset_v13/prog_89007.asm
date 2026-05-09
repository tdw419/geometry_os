; DESCRIPTION: Places a orange line segment connecting (81, 208) to (305, 251).
; PLAN: r0=81(x1), r1=208(y1), r2=305(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 208
LDI r2, 305
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
