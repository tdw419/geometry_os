; DESCRIPTION: Draws a orange line from (303, 229) to (272, 104).
; PLAN: r0=303(x1), r1=229(y1), r2=272(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 229
LDI r2, 272
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
