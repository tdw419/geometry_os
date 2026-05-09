; DESCRIPTION: Renders a orange line between points (272, 252) and (508, 152).
; PLAN: r0=272(x1), r1=252(y1), r2=508(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 252
LDI r2, 508
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
