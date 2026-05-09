; DESCRIPTION: Places a orange line segment connecting (363, 38) to (305, 86).
; PLAN: r0=363(x1), r1=38(y1), r2=305(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 38
LDI r2, 305
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
