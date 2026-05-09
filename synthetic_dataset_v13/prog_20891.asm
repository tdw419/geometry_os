; DESCRIPTION: Draws a orange line from (210, 58) to (7, 191).
; PLAN: r0=210(x1), r1=58(y1), r2=7(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 58
LDI r2, 7
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
