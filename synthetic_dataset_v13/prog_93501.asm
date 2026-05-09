; DESCRIPTION: Places a orange line segment connecting (391, 128) to (363, 24).
; PLAN: r0=391(x1), r1=128(y1), r2=363(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 128
LDI r2, 363
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
