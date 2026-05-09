; DESCRIPTION: Places a orange line segment connecting (272, 243) to (181, 36).
; PLAN: r0=272(x1), r1=243(y1), r2=181(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 243
LDI r2, 181
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
